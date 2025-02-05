import 'package:get_it/get_it.dart';
import 'package:topshop/data/auth/repository/auth_repository_imp.dart';
import 'package:topshop/data/auth/source/auth_firebase_service.dart';
import 'package:topshop/data/cart/repository/cart_imp.dart';
import 'package:topshop/data/cart/source/cart_firebase_service.dart';
import 'package:topshop/data/category/repository/category.dart';
import 'package:topshop/data/category/source/category_firebase_service.dart';
import 'package:topshop/data/products/repository/products_repository_imp.dart';
import 'package:topshop/data/products/source/products_firebase_service.dart';
import 'package:topshop/domain/auth/repository/auth.dart';
import 'package:topshop/domain/auth/usecases/get_ages.dart';
import 'package:topshop/domain/auth/usecases/get_user.dart';
import 'package:topshop/domain/auth/usecases/is_logged_in.dart';
import 'package:topshop/domain/auth/usecases/password_reset_email.dart';
import 'package:topshop/domain/auth/usecases/signin.dart';
import 'package:topshop/domain/auth/usecases/signup.dart';
import 'package:topshop/domain/cart/repository/cart.dart';
import 'package:topshop/domain/cart/usecases/add_to_cart.dart';
import 'package:topshop/domain/category/repository/categories.dart';
import 'package:topshop/domain/category/usecases/get_categories.dart';
import 'package:topshop/domain/products/repository/products.dart';
import 'package:topshop/domain/products/usecases/get_by_category.dart';
import 'package:topshop/domain/products/usecases/get_new_in.dart';
import 'package:topshop/domain/products/usecases/get_search_product.dart';
import 'package:topshop/domain/products/usecases/get_top_selling.dart';

final sl = GetIt.instance;

Future<void> initializeDependecies() async {
  // services

  sl.registerSingleton<AuthFirebaseService>(AuthFirebaseImp());
  sl.registerSingleton<CategoryFirebaseService>(CategoryFirebaseServiceImp());
  sl.registerSingleton<ProductsFirebaseService>(ProductsFirebaseServiceImp());
  sl.registerSingleton<CartFirebaseService>(CartFirebaseServiceImp());

  // repositories

  sl.registerSingleton<AuthRepositiory>(AuthRepositoryImp());
  sl.registerSingleton<CategoryRepository>(CategoryRepositoryImp());
  sl.registerSingleton<ProductsRepository>(ProductsRepositoryImp());
  sl.registerSingleton<CartRepository>(CartRepositoryImp());

  // usecases
  sl.registerSingleton<SignupUseCase>(SignupUseCase());
  sl.registerSingleton<SignInUseCase>(SignInUseCase());
  sl.registerSingleton<GetAgesUseCase>(GetAgesUseCase());
  sl.registerSingleton<PasswordResetEmailUseCase>(PasswordResetEmailUseCase());
  sl.registerSingleton<IsLoggedInUseCase>(IsLoggedInUseCase());
  sl.registerSingleton<GetUserUseCase>(GetUserUseCase());

  sl.registerSingleton<GetCategoriesUseCase>(GetCategoriesUseCase());

  sl.registerSingleton<GetProductTopSellingUseCase>(
      GetProductTopSellingUseCase());
  sl.registerSingleton<GetNewInUsecase>(GetNewInUsecase());
  sl.registerSingleton<GetProductsByCategoryUseCase>(
      GetProductsByCategoryUseCase());
  sl.registerSingleton<GetSearchProductUseCase>(GetSearchProductUseCase());

  sl.registerSingleton<AddToCartUseCase>(AddToCartUseCase());
}
