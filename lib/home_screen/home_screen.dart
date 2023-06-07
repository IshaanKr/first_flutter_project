import 'package:first_flutter_project/home_screen/home_screen_cubit.dart';
import 'package:first_flutter_project/utils/helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'rest_client.dart';
import '../rail/rail.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(context) {
    return BlocBuilder<HomeScreenCubit, HomeScreenResponse?>(
      builder: (context, response) {
        if (response == null) {
          return tataPlayLoading;
        }

        if (response.items.isEmpty) {
          return noContentToDisplayText;
        }

        var items = response.items;

        return Container(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              var item = items[index];
              return Rail(item: item);
            },
          ),
        );
      },
    );
  }
}