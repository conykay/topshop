import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:topshop/common/helper/nav/app_navigation.dart';
import 'package:topshop/core/configs/assets/app_images.dart';
import 'package:topshop/core/configs/theme/app_colors.dart';
import 'package:topshop/domain/auth/entities/user.dart';
import 'package:topshop/presentation/cart/pages/cart_page.dart';
import 'package:topshop/presentation/home/bloc/user_info_cubit.dart';
import 'package:topshop/presentation/home/bloc/user_info_state.dart';
import 'package:topshop/presentation/profile/pages/profile_page.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserInfoCubit()..getUserinfo(),
      child: Padding(
        padding: const EdgeInsets.only(top: 40, right: 16, left: 16),
        child: BlocBuilder<UserInfoCubit, UserInfoState>(
            builder: (context, state) {
          if (state is UserInfoLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is UserInfoLoaded) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _ProfileImage(user: state.user),
                _UserGender(user: state.user),
                _CartButton(context: context),
              ],
            );
          }
          return Container();
        }),
      ),
    );
  }
}

class _CartButton extends StatelessWidget {
  const _CartButton({
    required this.context,
  });

  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        AppNavigator.push(context, CartPage());
      },
      child: Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
          color: AppColors.primary,
          shape: BoxShape.circle,
        ),
        child: Icon(Icons.shopping_cart),
      ),
    );
  }
}

class _UserGender extends StatelessWidget {
  const _UserGender({
    required this.user,
  });

  final UserEntity user;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      padding: EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: AppColors.secondBackground,
        borderRadius: BorderRadius.circular(100),
      ),
      child: Center(
        child: Text(
          user.gender == 1 ? 'Male' : 'Female',
        ),
      ),
    );
  }
}

class _ProfileImage extends StatelessWidget {
  const _ProfileImage({
    required this.user,
  });

  final UserEntity user;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        AppNavigator.push(context, ProfilePage(user: user));
      },
      child: Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
          color: Colors.redAccent,
          shape: BoxShape.circle,
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
    );
  }
}
