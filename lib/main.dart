import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:topshop/core/configs/theme/app_theme.dart';
import 'package:topshop/presentation/spash/bloc/splash_cubit.dart';
import 'package:topshop/presentation/spash/pages/splash.dart';
import 'package:topshop/service_locator.dart';

import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await initializeDependecies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SplashCubit()..appStarted(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: AppTheme.appTheme,
        home: const SplashPage(),
      ),
    );
  }
}
