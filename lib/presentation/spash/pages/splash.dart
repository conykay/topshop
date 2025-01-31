import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:topshop/common/helper/nav/app_navigation.dart';
import 'package:topshop/presentation/authentication/pages/signup_page.dart';
import 'package:topshop/presentation/home/pages/home.dart';
import 'package:topshop/presentation/spash/bloc/splash_cubit.dart';
import 'package:topshop/presentation/spash/bloc/splash_state.dart';

import '../../../core/configs/theme/app_colors.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SplashCubit, SplashState>(
      listener: (context, state) {
        if (state is UnAuthenticated) {
          AppNavigator.pushReplacement(context, SignupPage());
        }
        if (state is Authenticated) {
          AppNavigator.pushReplacement(context, HomePage());
        }
      },
      child: const Scaffold(
        backgroundColor: AppColors.primary,
        body: Center(
          child: Text(
            'TopShop',
            style: TextStyle(
              color: Colors.white,
              fontSize: 50,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
