import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_practice/src/cubits/pets/pets_cubit.dart';
import 'package:flutter_practice/src/cubits/pets/pets_state.dart';
import 'package:flutter_practice/src/screens/home/components/pet_card_widget.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class PetListWidget extends StatefulWidget {
  const PetListWidget({super.key});

  @override
  State<PetListWidget> createState() => _PetListWidgetState();
}

class _PetListWidgetState extends State<PetListWidget> {
  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  @override
  void initState() {
    context.read<PetsCubit>().getAllPets();
    super.initState();
  }

  void _onRefresh() async {
    await context.read<PetsCubit>().getAllPets();

    _refreshController.refreshCompleted();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top: 15, left: 15, right: 15),
        child: BlocConsumer<PetsCubit, PetsState>(
          listener: (context, state) {
            if (state is PetsErrorState) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.message),
                ),
              );
            }
          },
          builder: (context, state) {
            if (state is PetsLoadingState && !_refreshController.isRefresh) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            final pets = state is PetsLoadedState ? state.pets : [];

            return SmartRefresher(
                enablePullDown: true,
                enablePullUp: false,
                header: const ClassicHeader(),
                controller: _refreshController,
                onRefresh: _onRefresh,
                child: ListView.builder(
                  itemCount: pets.length,
                  itemBuilder: (BuildContext context, int index) {
                    return PetCardWidget(pet: pets[index]);
                  },
                ));
          },
        ));
  }
}
