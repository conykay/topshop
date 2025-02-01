import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:topshop/common/bloc/button/button_state.dart';
import 'package:topshop/common/bloc/button/button_state_cubit.dart';
import 'package:topshop/common/helper/nav/app_navigation.dart';
import 'package:topshop/common/widgets/appbar/app_bar.dart';
import 'package:topshop/common/widgets/button/basic_reactive_button.dart';
import 'package:topshop/core/configs/theme/app_colors.dart';
import 'package:topshop/data/auth/models/user_login_req.dart';
import 'package:topshop/domain/auth/usecases/signin.dart';
import 'package:topshop/presentation/authentication/pages/forgot_password_page.dart';
import 'package:topshop/presentation/home/pages/home.dart';

class EnterPasswordPage extends StatelessWidget {
  final UserSignInReq userSignInReq;
  EnterPasswordPage({super.key, required this.userSignInReq});

  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppBar(),
      backgroundColor: AppColors.background,
      body: BlocProvider(
        create: (context) => ButtonStateCubit(),
        child: BlocListener<ButtonStateCubit, ButtonState>(
          listener: (context, state) {
            if (state is ButtonFailureState) {
              var snackbar = SnackBar(
                content: Text(state.errorMessage),
                behavior: SnackBarBehavior.floating,
              );
              ScaffoldMessenger.of(context).showSnackBar(snackbar);
            }

            if (state is ButtonSuccessSate) {
              AppNavigator.pushAndRemove(context, HomePage());
            }
          },
          child: Padding(
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
      controller: _passwordController,
      decoration: InputDecoration(
        hintText: 'Enter password',
      ),
    );
  }

  Widget _continueButton(BuildContext context) {
    return Builder(builder: (context) {
      return BasicReactiveButton(
        onPressed: () {
          userSignInReq.password = _passwordController.text;
          context
              .read<ButtonStateCubit>()
              .execute(usecase: SignInUseCase(), params: userSignInReq);
        },
        title: 'Continue',
      );
    });
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
