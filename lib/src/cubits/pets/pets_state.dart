import 'package:equatable/equatable.dart';
import 'package:flutter_practice/src/shared/models/pet_model.dart';

abstract class PetsState extends Equatable {}

class InitialState extends PetsState {
  @override
  List<Object> get props => [];
}

class PetsLoadingState extends PetsState {
  @override
  List<Object> get props => [];
}

class PetsLoadedState extends PetsState {
  final List<Pet> pets;

  PetsLoadedState({required this.pets});

  @override
  List<Object> get props => [pets];
}

class PetsErrorState extends PetsState {
  final String message;

  PetsErrorState({required this.message});

  @override
  List<Object> get props => [];
}
