import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:topshop/common/bloc/button/button_state.dart';
import 'package:topshop/common/bloc/button/button_state_cubit.dart';
import 'package:topshop/common/helper/nav/app_navigation.dart';
import 'package:topshop/common/widgets/appbar/app_bar.dart';
import 'package:topshop/common/widgets/button/basic_reactive_button.dart';
import 'package:topshop/core/configs/theme/app_colors.dart';
import 'package:topshop/data/auth/models/user_creation_req.dart';
import 'package:topshop/domain/auth/usecases/signup.dart';
import 'package:topshop/presentation/authentication/bloc/age_display_cubit.dart';
import 'package:topshop/presentation/authentication/bloc/age_selection_cubit.dart';

import '../../../common/widgets/bottomsheet/ages_bottomsheet.dart';
import '../bloc/gender_selection_cubit.dart';
import '../widgets/ages.dart';

class GenderAndAgeSelectionPage extends StatelessWidget {
  final UserCreationReq userCreationReq;
  const GenderAndAgeSelectionPage({super.key, required this.userCreationReq});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppBar(),
      body: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => GenderSelectionCubit()),
          BlocProvider(create: (context) => ButtonStateCubit()),
          BlocProvider(create: (context) => AgeSelectionCubit()),
          BlocProvider(create: (context) => AgeDisplayCubit()),
        ],
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
              AppNavigator.pushAndRemove(context);
            }
          },
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _tellUs(),
                    SizedBox(height: 30),
                    _genders(context),
                    SizedBox(height: 30),
                    howOld(),
                    SizedBox(height: 30),
                    _age(),
                  ],
                ),
              ),
              Spacer(),
              _finishButton(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _tellUs() {
    return Text(
      'Tell us about yourself',
      style: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w500,
      ),
    );
  }

  Widget _genders(BuildContext context) {
    return BlocBuilder<GenderSelectionCubit, int>(
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            genderTitle(context, 1, 'Male'),
            SizedBox(width: 20),
            genderTitle(context, 2, 'Female'),
          ],
        );
      },
    );
  }

  Expanded genderTitle(BuildContext context, int genderIndex, String gender) {
    return Expanded(
        child: GestureDetector(
      onTap: () {
        context.read<GenderSelectionCubit>().selectGender(genderIndex);
      },
      child: Container(
        height: 60,
        decoration: BoxDecoration(
          color:
              context.read<GenderSelectionCubit>().selectedIndex == genderIndex
                  ? AppColors.primary
                  : AppColors.secondBackground,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Center(
          child: Text(
            gender,
            style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
          ),
        ),
      ),
    ));
  }

  Widget howOld() {
    return Text(
      'How old are you ?',
      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w500,
      ),
    );
  }

  Widget _age() {
    return BlocBuilder<AgeSelectionCubit, String>(
      builder: (context, state) {
        return GestureDetector(
          onTap: () {
            AppBottomSheet.display(
              context,
              MultiBlocProvider(
                providers: [
                  BlocProvider.value(value: context.read<AgeSelectionCubit>()),
                  BlocProvider.value(
                    value: context.read<AgeDisplayCubit>()..getAges(),
                  ),
                ],
                child: Ages(),
              ),
            );
          },
          child: Container(
            height: 60,
            padding: EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: AppColors.secondBackground,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  context.read<AgeSelectionCubit>().selectedAge,
                ),
                Icon(Icons.keyboard_arrow_down)
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _finishButton(BuildContext context) {
    return Container(
      height: 100,
      color: AppColors.secondBackground,
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Center(
        child: Builder(
          builder: (context) {
            return BasicReactiveButton(
              onPressed: () {
                userCreationReq.gender =
                    context.read<GenderSelectionCubit>().selectedIndex;
                userCreationReq.age =
                    context.read<AgeSelectionCubit>().selectedAge;
                context.read<ButtonStateCubit>().execute(
                      usecase: SignupUseCase(),
                      params: userCreationReq,
                    );
              },
              title: 'Finish',
            );
          },
        ),
      ),
    );
  }
}
