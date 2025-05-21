import 'package:evently_plan/core/DM/user_DM.dart';
import 'package:evently_plan/core/assets_maneger.dart';
import 'package:evently_plan/core/colors_maneger.dart';
import 'package:flutter/material.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ColorsManager.blue,
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(60)),
      ),
      child: SafeArea(
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Image(image: AssetImage(AssetsManeger.profileImage)),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    UserDm.currentUser!.userName,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      color: ColorsManager.white,
                    ),
                  ),
                  SizedBox(height: 16,),
                  Text(
                    softWrap: true,
                    UserDm.currentUser!.email,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: ColorsManager.white,
                    ),
                  ),

                ],
              ),
            ),
            SizedBox(width: 16,)
          ],
        ),
      ),
    );
  }
}
