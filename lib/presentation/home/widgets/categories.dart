import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:topshop/common/bloc/categories/categories_display_cubit.dart';
import 'package:topshop/common/bloc/categories/categories_display_state.dart';
import 'package:topshop/common/helper/images/image_display.dart';
import 'package:topshop/common/helper/nav/app_navigation.dart';
import 'package:topshop/domain/category/entities/category.dart';
import 'package:topshop/presentation/all_categories/pages/categories_display_page.dart';

class Categories extends StatelessWidget {
  const Categories({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CategoriesDisplayCubit()..getCategories(),
      child: BlocBuilder<CategoriesDisplayCubit, CategoryDisplayState>(
          builder: (context, state) {
        if (state is CategoriesLoading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is CategoriesLoaded) {
          return Column(
            children: [
              _SeeAllText(),
              SizedBox(height: 20),
              _CategoriesDisplayList(categories: state.categories),
            ],
          );
        }
        return Container();
      }),
    );
  }
}

class _CategoriesDisplayList extends StatelessWidget {
  const _CategoriesDisplayList({
    required this.categories,
  });

  final List<CategoryEntity> categories;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 16),
        itemBuilder: (context, index) {
          return Column(
            children: [
              CachedNetworkImage(
                imageUrl: ImageDisplayHelper.displayCategoryImage(
                    categories[index].image),
                imageBuilder: (context, provider) => Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: provider,
                        fit: BoxFit.fill,
                      ),
                      shape: BoxShape.circle,
                      color: Colors.white,
                    )),
                progressIndicatorBuilder: (context, url, progress) => Center(
                    child: CircularProgressIndicator(
                  value: progress.progress,
                )),
              ),
              SizedBox(height: 10),
              Text(
                categories[index].title,
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                ),
              )
            ],
          );
        },
        separatorBuilder: (context, index) => SizedBox(width: 16),
        itemCount: categories.length,
      ),
    );
  }
}

class _SeeAllText extends StatelessWidget {
  const _SeeAllText();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Categories',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          GestureDetector(
            onTap: () {
              AppNavigator.push(context, AllCategoriesPage());
            },
            child: Text(
              'See All',
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
