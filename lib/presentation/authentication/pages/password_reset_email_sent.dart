import 'package:flutter/material.dart';
import 'package:topshop/common/helper/nav/app_navigation.dart';
import 'package:topshop/common/widgets/appbar/app_bar.dart';
import 'package:topshop/common/widgets/button/basic_app_button.dart';
import 'package:topshop/core/configs/theme/app_colors.dart';
import 'package:topshop/presentation/authentication/pages/signin.dart';

class PasswordResetEmailSent extends StatelessWidget {
  const PasswordResetEmailSent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppBar(),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _emailSentIcon(),
              SizedBox(height: 20.0),
              _emailSendMessage(),
              SizedBox(height: 20.0),
              _returnToSignin(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _emailSentIcon() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.send_rounded,
          color: AppColors.secondBackground,
          size: 50.0,
        ),
        SizedBox(
          width: 20.0,
        ),
        Icon(
          Icons.mark_as_unread,
          color: Colors.yellowAccent,
          size: 100.0,
        )
      ],
    );
  }

  Widget _emailSendMessage() {
    return Text(
      'Email reset link sent successfuly, check your inbox.',
      style: TextStyle(fontSize: 16),
    );
  }

  Widget _returnToSignin(BuildContext context) {
    return BasicButton(
      onPressed: () {
        AppNavigator.pushReplacement(context, SigninPage());
      },
      title: 'Back to sign in',
    );
  }
}
