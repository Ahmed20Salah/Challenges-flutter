import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:global_online/core/config/apis/config_api.dart';
import 'package:global_online/core/utils/constant.dart';
import 'package:global_online/module/blogs/controller/blog_controller.dart';
import 'package:shimmer/shimmer.dart';

import '../../../core/resources/resource.dart';
import '../../../core/widgets/custom_text_field_widget.dart';

class BlogsScreen extends GetView<BlogsController> {
  const BlogsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorManager.white,
        centerTitle: true,
        title: Text(
          'Blogs',
          style: getBoldStyle(color: ColorManager.goodMorning, fontSize: 16.sp),
        ),
        elevation: 0,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20.r),
                bottomRight: Radius.circular(20.r))),
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back,
            color: ColorManager.goodMorning,
            size: 20,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(ImageAssets.iconNotification),
          ),
        ],
      ),
      // bottomSheet: Container(
      //   color: ColorManager.white,
      //   child: Column(
      //     children: [
      //       Padding(
      //         padding: const EdgeInsets.symmetric(horizontal: 27, vertical: 24),
      //         child: CustomTextFieldWidget(
      //           hint: 'search here',
      //           colorFilled: ColorManager.lightGrey.withOpacity(0.2),
      //           prefix: Padding(
      //             padding: const EdgeInsets.all(12.0),
      //             child: SvgPicture.asset(
      //               ImageAssets.iconSearch,
      //               width: 5.w,
      //               height: 5.h,
      //             ),
      //           ),
      //           hintStyle: getRegularStyle(
      //               color: ColorManager.darkGrey, fontSize: 14.sp),
      //         ),
      //       ),
      //       SizedBox(height: 26.h),
      //     ],
      //   ),
      // ),
      // body: SafeArea(
      //   child: Padding(
      //     padding: const EdgeInsets.only(top: 10),
      //     child: GetBuilder<BlogsController>(builder: (logic) {
      //       print(logic.rxRequestStatus.value);

      //       switch (logic.rxRequestStatus.value) {
      //         case RequestStatus.SUCESS:
      //           return ListView.builder(
      //               itemCount: 5,
      //               itemBuilder: (context, index) {
      //                 return Container(
      //                   decoration: const BoxDecoration(
      //                       color: Colors.amber,
      //                       image: DecorationImage(
      //                           image: NetworkImage(
      //                               'https://buffer.com/cdn-cgi/image/w=1000,fit=contain,q=90,f=auto/library/content/images/size/w1200/2023/10/free-images.jpg'))),
      //                   child: const SizedBox(
      //                     height: 20.0,
      //                     width: 100,
      //                     child: Column(
      //                       children: [],
      //                     ),
      //                   ),
      //                 );
      //               });

      //         case RequestStatus.ERROR:
      //           return Container();

      //         case RequestStatus.LOADING:
      //           return Shimmer.fromColors(
      //             baseColor: Colors.grey.withOpacity(0.2),
      //             highlightColor: Colors.white.withOpacity(0.2),
      //             child: ListView.builder(
      //                 itemCount: 4,
      //                 padding: EdgeInsets.symmetric(horizontal: 26.w),
      //                 itemBuilder: (context, index) {
      //                   return Container(
      //                     margin: EdgeInsets.only(top: 19.h),
      //                     decoration: ShapeDecoration(
      //                       color: Colors.white,
      //                       shape: RoundedRectangleBorder(
      //                         borderRadius: BorderRadius.circular(20),
      //                       ),
      //                     ),
      //                     padding: EdgeInsetsDirectional.only(
      //                         top: 24.h, bottom: 20.h, start: 18.w, end: 18.w),
      //                     child: Column(
      //                       children: [
      //                         Text(
      //                           '23 Jul 2023',
      //                           style: getBoldItalicStyle(
      //                               color: ColorManager.blackText,
      //                               fontSize: 16.sp),
      //                         ),
      //                         SizedBox(
      //                           height: 20,
      //                         ),
      //                         Row(
      //                           mainAxisAlignment:
      //                               MainAxisAlignment.spaceBetween,
      //                           children: [
      //                             Column(
      //                               children: [
      //                                 CircleAvatar(
      //                                   radius: 54 / 2,
      //                                 ),
      //                                 SizedBox(
      //                                   height: 15.h,
      //                                 ),
      //                                 Text(
      //                                   'Kalday Team',
      //                                   style: getBoldStyle(
      //                                       color: ColorManager.blackText,
      //                                       fontSize: 16.sp),
      //                                 ),
      //                                 SizedBox(
      //                                   height: 5.h,
      //                                 ),
      //                                 Row(
      //                                   children: [
      //                                     SvgPicture.asset(
      //                                       ImageAssets.iconSpark,
      //                                       color: Color(0xffF99F1B),
      //                                     ),
      //                                     SizedBox(
      //                                       width: AppSize.s8.w,
      //                                     ),
      //                                     Text(
      //                                       '2,345 xp',
      //                                       style: getRegularStyle(
      //                                           color: ColorManager.blackText),
      //                                     ),
      //                                   ],
      //                                 )
      //                               ],
      //                             ),
      //                             Column(
      //                               children: [
      //                                 Text(
      //                                   '18:00',
      //                                   style: getBoldStyle(
      //                                       color: ColorManager.blackText,
      //                                       fontSize: 16.sp),
      //                                 ),
      //                                 Text(
      //                                   '2 days',
      //                                   style: getMediumStyle(
      //                                       color: ColorManager.blackText,
      //                                       fontSize: 14.sp),
      //                                 ),
      //                               ],
      //                             ),
      //                             Column(
      //                               children: [
      //                                 CircleAvatar(
      //                                   radius: 54 / 2,
      //                                 ),
      //                                 SizedBox(
      //                                   height: 15.h,
      //                                 ),
      //                                 Text(
      //                                   'Lansing Team',
      //                                   style: getBoldStyle(
      //                                       color: ColorManager.blackText,
      //                                       fontSize: 16.sp),
      //                                 ),
      //                                 SizedBox(
      //                                   height: 5.h,
      //                                 ),
      //                                 Row(
      //                                   children: [
      //                                     SvgPicture.asset(
      //                                       ImageAssets.iconSpark,
      //                                       color: Color(0xffF99F1B),
      //                                     ),
      //                                     SizedBox(
      //                                       width: AppSize.s8.w,
      //                                     ),
      //                                     Text(
      //                                       '2,345 xp',
      //                                       style: getRegularStyle(
      //                                           color: ColorManager.blackText),
      //                                     ),
      //                                   ],
      //                                 )
      //                               ],
      //                             ),
      //                           ],
      //                         ),
      //                         SizedBox(
      //                           height: 30.h,
      //                         ),
      //                         Divider(),
      //                         Row(
      //                           children: [
      //                             Icon(Icons.location_on),
      //                             Text(
      //                               'City Stad, city, street 1234',
      //                               style: getMediumStyle(
      //                                   color: ColorManager.goodMorning,
      //                                   fontSize: 12.sp),
      //                             )
      //                           ],
      //                         )
      //                       ],
      //                     ),
      //                   );
      //                 }),
      //           );
      //       }

      //       return Container();
      //     }),
      //   ),
      // ),

      body: controller.obx(
        (state) => ListView.builder(
            itemCount: 5,
            itemBuilder: (context, index) {
              return Container(
                margin: const EdgeInsets.only(bottom: 28, right: 22, left: 22),
                height: 270,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.amber,
                    image: DecorationImage(
                        image: NetworkImage(
                          state![index].imageUrl.replaceFirst('/images', ''),
                        ),
                        fit: BoxFit.cover)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 25, vertical: 15),
                      margin: EdgeInsets.symmetric(horizontal: 26),
                      decoration: BoxDecoration(
                          color: ColorManager.white,
                          borderRadius: BorderRadius.circular(20)),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            state[index].title,
                            style: const TextStyle(
                                color: ColorManager.blackText,
                                fontWeight: FontWeight.w700,
                                fontSize: 16),
                          ),
                          Text(
                            state[index].description,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                                color: ColorManager.blackText, fontSize: 12),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 18,
                    )
                  ],
                ),
              );
            }),

        // here you can put your custom loading indicator, but
        // by default would be Center(child:CircularProgressIndicator())
        onLoading: const Text('loading'),
        onEmpty: const Text('No data found'),

        // here also you can set your own error widget, but by
        // default will be an Center(child:Text(error))
        onError: (error) => Text(error!),
      ),
    );
    // );
  }
}
