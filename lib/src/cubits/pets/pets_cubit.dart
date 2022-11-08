import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_practice/src/cubits/pets/pets_state.dart';
import 'package:flutter_practice/src/repositories/pet_repository.dart';

class PetsCubit extends Cubit<PetsState> {
  final PetRepository repository;

  PetsCubit({required this.repository}) : super(InitialState());

  Future<void> getAllPets() async {
    try {
      emit(PetsLoadingState());
      final pets = await repository.fetchAllPets();
      emit(PetsLoadedState(pets: pets));
    } catch (e) {
      print(e);
      emit(PetsErrorState(message: e.toString()));
    }
  }
}
