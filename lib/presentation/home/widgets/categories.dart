import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:topshop/common/bloc/categories/categories_display_cubit.dart';
import 'package:topshop/common/bloc/categories/categories_display_state.dart';
import 'package:topshop/common/helper/images/image_display.dart';
import 'package:topshop/core/constants/app_urls.dart';
import 'package:topshop/domain/category/entity/category.dart';

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
              _seeAll(),
              SizedBox(height: 20),
              _categories(categories: state.categories),
            ],
          );
        }
        return Container();
      }),
    );
  }

  Widget _seeAll() {
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
            onTap: () {},
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

  Widget _categories({required List<CategoryEntity> categories}) {
    return SizedBox(
      height: 100,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 16),
        itemBuilder: (context, index) {
          return Column(
            children: [
              Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                      ImageDisplayHelper.displayCategoryImage(
                        categories[index].image,
                      ),
                    ),
                    fit: BoxFit.fill,
                  ),
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
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
