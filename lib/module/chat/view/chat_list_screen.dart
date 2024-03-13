import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:global_online/core/resources/resource.dart';
import 'package:global_online/core/routes/app_routes.dart';
import 'package:global_online/core/widgets/custom_text_field_widget.dart';

class ChatListScreen extends StatelessWidget {
  const ChatListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            CustomTextFieldWidget(
              hint: 'search here',
              colorFilled: ColorManager.lightGrey.withOpacity(0.2),
              prefix: Padding(
                padding: const EdgeInsets.all(12.0),
                child: SvgPicture.asset(
                  ImageAssets.iconSearch,
                  width: 14.w,
                  height: 14.h,
                ),
              ),
              hintStyle: getRegularStyle(
                  color: ColorManager.darkGrey, fontSize: 14.sp),
            ),
            SizedBox(height: 26.h),
            Expanded(
              child: ListView.separated(
                shrinkWrap: true,
                itemCount: 12,
                separatorBuilder: (context, index) => const Divider(),
                itemBuilder: (context, index) {
                  return ListTile(
                    onTap: () => Get.toNamed(AppRoutes.chat),
                    leading: const CircleAvatar(
                      radius: 21.0,
                      foregroundImage: AssetImage(ImageAssets.profile),
                    ),
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Mhammed sami',
                          style: getBoldItalicStyle(
                              color: ColorManager.blackText,
                              fontSize: FontSize.s16.sp),
                          overflow: TextOverflow.ellipsis,
                          softWrap: true,
                        ),
                        Text(
                          'We have an imp...',
                          style: getRegularStyle(
                              color: ColorManager.blackText,
                              fontSize: FontSize.s12.sp),
                          overflow: TextOverflow.ellipsis,
                          softWrap: true,
                        ),
                      ],
                    ),
                    trailing: Container(
                      height: 20.0,
                      width: 20.0,
                      decoration: const BoxDecoration(
                        color: ColorManager.harlequin,
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Text(
                          '3',
                          style: getBoldStyle(
                            color: ColorManager.white,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

