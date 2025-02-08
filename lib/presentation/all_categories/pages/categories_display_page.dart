import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:topshop/common/bloc/categories/categories_display_cubit.dart';
import 'package:topshop/common/bloc/categories/categories_display_state.dart';
import 'package:topshop/common/helper/images/image_display.dart';
import 'package:topshop/common/helper/nav/app_navigation.dart';
import 'package:topshop/common/widgets/appbar/app_bar.dart';
import 'package:topshop/core/configs/theme/app_colors.dart';
import 'package:topshop/presentation/category_products/pages/category_products.dart';

class AllCategoriesPage extends StatelessWidget {
  const AllCategoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: BlocProvider(
            create: (context) => CategoriesDisplayCubit()..getCategories(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _ShopByCategoriesText(),
                SizedBox(height: 20),
                _CategoriesListDisplay(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _CategoriesListDisplay extends StatelessWidget {
  const _CategoriesListDisplay();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoriesDisplayCubit, CategoryDisplayState>(
        builder: (context, state) {
      if (state is CategoriesLoading) {
        return Center(child: CircularProgressIndicator());
      }
      if (state is CategoriesLoaded) {
        var categories = state.categories;
        return ListView.separated(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                AppNavigator.push(
                    context, CategoryProductsPage(category: categories[index]));
              },
              child: Card(
                color: AppColors.secondBackground,
                child: Row(
                  children: [
                    CachedNetworkImage(
                      imageUrl: ImageDisplayHelper.displayCategoryImage(
                          categories[index].image),
                      imageBuilder: (context, provider) => Container(
                        height: 80,
                        width: 80,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            bottomLeft: Radius.circular(10),
                          ),
                          image: DecorationImage(
                            image: provider,
                          ),
                        ),
                      ),
                      progressIndicatorBuilder: (context, url, progress) =>
                          Center(
                        child: CircularProgressIndicator(
                          value: progress.progress,
                        ),
                      ),
                    ),
                    SizedBox(width: 20),
                    Text(
                      categories[index].title,
                      style: TextStyle(
                        fontSize: 22,
                      ),
                    )
                  ],
                ),
              ),
            );
          },
          separatorBuilder: (context, index) => SizedBox(height: 5),
          itemCount: categories.length,
        );
      }
      return Container();
    });
  }
}

class _ShopByCategoriesText extends StatelessWidget {
  const _ShopByCategoriesText();

  @override
  Widget build(BuildContext context) {
    return Text(
      'Shop By Categories',
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 20,
      ),
    );
  }
}
