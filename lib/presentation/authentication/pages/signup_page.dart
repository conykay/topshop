import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:topshop/common/helper/nav/app_navigation.dart';
import 'package:topshop/common/widgets/appbar/app_bar.dart';
import 'package:topshop/common/widgets/button/basic_app_button.dart';
import 'package:topshop/core/configs/theme/app_colors.dart';
import 'package:topshop/data/auth/models/user_creation_req.dart';
import 'package:topshop/presentation/authentication/pages/gender_and_age_selection.dart';

class SignupPage extends StatelessWidget {
  SignupPage({super.key});

  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppBar(),
      backgroundColor: AppColors.background,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _signupText(context),
              SizedBox(height: 20),
              _firstNameField(context),
              SizedBox(height: 20),
              _lastNameField(context),
              SizedBox(height: 20),
              _emailField(context),
              SizedBox(height: 20),
              _passwordField(context),
              SizedBox(height: 20),
              _continueButton(context),
              SizedBox(height: 20),
              _signinAccount(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _signupText(BuildContext context) {
    return Text(
      'Sign Up',
      style: TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _firstNameField(BuildContext context) {
    return TextField(
      controller: _firstNameController,
      decoration: InputDecoration(
        hintText: 'Enter first name',
      ),
    );
  }

  Widget _lastNameField(BuildContext context) {
    return TextField(
      controller: _lastNameController,
      decoration: InputDecoration(
        hintText: 'Enter last name',
      ),
    );
  }

  Widget _emailField(BuildContext context) {
    return TextField(
      controller: _emailController,
      decoration: InputDecoration(
        hintText: 'Enter email',
      ),
    );
  }

  Widget _passwordField(BuildContext context) {
    return TextField(
      controller: _passwordController,
      decoration: InputDecoration(
        hintText: 'Enter password',
      ),
    );
  }

  Widget _continueButton(BuildContext context) {
    return BasicButton(
      onPressed: () {
        AppNavigator.push(
          context,
          GenderAndAgeSelectionPage(
              userCreationReq: UserCreationReq(
            firstName: _firstNameController.text,
            lastName: _lastNameController.text,
            email: _emailController.text,
            password: _passwordController.text,
          )),
        );
      },
      title: 'Continue',
    );
  }

  Widget _signinAccount(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(text: 'Already have an account? '),
          TextSpan(
            text: 'Sign In',
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                AppNavigator.pushReplacement(context, SignupPage());
              },
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
