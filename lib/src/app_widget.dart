import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_practice/src/api_client.dart';
import 'package:flutter_practice/src/cubits/pets/pets_cubit.dart';
import 'package:flutter_practice/src/repositories/pet_repository.dart';
import 'package:flutter_practice/src/screens/home/home_widget.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Practice',
        theme: ThemeData(),
        home: BlocProvider(
          create: (context) =>
              PetsCubit(repository: PetRepository(Client().init())),
          child: const HomeWidget(),
        ),
        debugShowCheckedModeBanner: false);
  }
}
