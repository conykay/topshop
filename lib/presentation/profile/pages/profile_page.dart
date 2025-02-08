import 'package:flutter/material.dart';
import 'package:topshop/common/helper/nav/app_navigation.dart';
import 'package:topshop/common/widgets/appbar/app_bar.dart';
import 'package:topshop/core/configs/theme/app_colors.dart';
import 'package:topshop/domain/auth/entities/user.dart';
import 'package:topshop/presentation/profile/pages/favorites_page.dart';
import 'package:topshop/presentation/profile/pages/orders_page.dart';

import '../../../core/configs/assets/app_images.dart';

class ProfilePage extends StatelessWidget {
  final UserEntity user;
  const ProfilePage({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppBar(title: Text('Profile')),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 120,
              width: 120,
              decoration: BoxDecoration(
                color: Colors.redAccent,
                shape: BoxShape.circle,
                border:
                    Border.all(color: AppColors.secondBackground, width: 10),
                image: DecorationImage(
                  image: user.image.isEmpty
                      ? AssetImage(
                          user.gender != 1
                              ? AppImages.defaultProfileFemale
                              : AppImages.defaultProfileMale,
                        )
                      : NetworkImage(user.image),
                ),
              ),
            ),
            SizedBox(height: 20),
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: AppColors.secondBackground,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${user.firstName} ${user.lastName}',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  SizedBox(height: 5),
                  Text(
                    user.email,
                    style: TextStyle(fontSize: 18),
                  ),
                  SizedBox(height: 5),
                  Text(
                    user.gender == 1 ? 'Male' : 'Female',
                    style: TextStyle(fontSize: 18),
                  ),
                ],
              ),
            ),
            SizedBox(height: 25),
            GestureDetector(
              onTap: () {
                AppNavigator.push(context, FavoritesPage());
              },
              child: Container(
                width: double.infinity,
                height: 70,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: AppColors.secondBackground,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Wishlist',
                      style: TextStyle(fontSize: 22),
                    ),
                    Icon(Icons.arrow_forward_ios_rounded, size: 30),
                  ],
                ),
              ),
            ),
            SizedBox(height: 15),
            GestureDetector(
              onTap: () {
                AppNavigator.push(context, OrdersPage());
              },
              child: Container(
                width: double.infinity,
                height: 70,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: AppColors.secondBackground,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Orders',
                      style: TextStyle(fontSize: 22),
                    ),
                    Icon(Icons.arrow_forward_ios_rounded, size: 30),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
