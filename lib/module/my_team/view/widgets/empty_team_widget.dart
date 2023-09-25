
import 'package:flutter/material.dart';
import 'package:global_online/core/resources/resource.dart';

import '../../../../core/widgets/custom_elevated_button_widget.dart';

class EmptyTeamWidget extends StatelessWidget {
  const EmptyTeamWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(

        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 34),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 100.h,),
              SvgPicture.asset(ImageAssets.noTeamState),
              SizedBox(height: 32.h,),
              Text(
                'You Are Not A Member Of Any\n Teams Yet',
                textAlign: TextAlign.center,
                style: getBoldStyle(
                  color: Color(0xFF464455),
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 42.h,),
              CustomElevatedButton(title: 'Create Team')
            ],
          ),
        ));
  }
}