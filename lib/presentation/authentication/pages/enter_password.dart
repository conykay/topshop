import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:topshop/common/helper/nav/app_navigation.dart';
import 'package:topshop/common/widgets/appbar/app_bar.dart';
import 'package:topshop/common/widgets/button/basic_app_button.dart';
import 'package:topshop/core/configs/theme/app_colors.dart';
import 'package:topshop/presentation/authentication/pages/forgot_password_page.dart';

class EnterPasswordPage extends StatelessWidget {
  const EnterPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppBar(),
      backgroundColor: AppColors.background,
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _signinText(context),
            SizedBox(height: 20),
            _passwordField(context),
            SizedBox(height: 20),
            _continueButton(context),
            SizedBox(height: 20),
            _replacePassword(context),
          ],
        ),
      ),
    );
  }

  Widget _signinText(BuildContext context) {
    return Text(
      'Sign In',
      style: TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _passwordField(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: 'Enter password',
      ),
    );
  }

  Widget _continueButton(BuildContext context) {
    return BasicButton(
      onPressed: () {},
      title: 'Continue',
    );
  }

  Widget _replacePassword(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(text: 'Forgot password? '),
          TextSpan(
            text: 'Replace',
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                AppNavigator.push(context, ForgotPasswordPage());
              },
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
