// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:get/get.dart';
import 'package:global_online/core/utils/constant.dart';

import 'package:global_online/module/blogs/data/data_source/blogs_data_source.dart';
import 'package:global_online/module/blogs/data/data_source/models/blog.dart';

class BlogsController extends GetxController with StateMixin<List<BlogModel>> {
  IBlogsDataSource dataSource;
  BlogsController({required this.dataSource});
  final Rx<RequestStatus> rxRequestStatus = RequestStatus.LOADING.obs;
  void setRxRequestStatus(RequestStatus value) => rxRequestStatus.value = value;
  late RxList<BlogModel> blogs = <BlogModel>[].obs;

  void setRxBlogs(List<BlogModel> value) => blogs.value = value;

  @override
  void onInit() {
    super.onInit();

    getBlogs();
  }

  getBlogs() {
    dataSource.getBlogs('').then((value) {
      value.fold((l) {
        setRxRequestStatus(RequestStatus.ERROR);
        print(l);
      }, (r) {
        // setRxBlogs(r);

        change(r, status: RxStatus.success());
        setRxRequestStatus(RequestStatus.SUCESS);
      });
    });
  }
}
