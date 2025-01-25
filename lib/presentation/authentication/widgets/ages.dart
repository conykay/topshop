import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:topshop/presentation/authentication/bloc/age_display_cubit.dart';
import 'package:topshop/presentation/authentication/bloc/age_display_state.dart';
import 'package:topshop/presentation/authentication/bloc/age_selection_cubit.dart';

class Ages extends StatelessWidget {
  const Ages({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.45,
      child: BlocBuilder<AgeDisplayCubit, AgeDisplayState>(
        builder: (context, state) {
          if (state is AgeLoading) {
            return Container(
              alignment: Alignment.center,
              child: CircularProgressIndicator(),
            );
          }

          if (state is AgeLoaded) {
            return _ages(state.data);
          }

          if (state is AgeError) {
            return Container(
              alignment: Alignment.center,
              child: Text(state.message),
            );
          }
          return SizedBox();
        },
      ),
    );
  }

  ListView _ages(List<QueryDocumentSnapshot<Map<String, dynamic>>> data) {
    return ListView.separated(
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            context
                .read<AgeSelectionCubit>()
                .selectAge(data[index].data()['value']);
            Navigator.pop(context);
          },
          child: Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
            child: Text(
              data[index].data()['value'],
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ),
        );
      },
      separatorBuilder: (context, index) => Divider(),
      itemCount: data.length,
    );
  }
}
