import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter_practice/src/shared/models/pet_model.dart';

class PetRepository {
  final Dio _client;

  PetRepository(this._client);

  Future<List<Pet>> fetchAllPets() async {
    try {
      final response = await _client.get('/pet');

      final List decodedJson = json.decode(response.data.toString());
      final List<Pet> pets = decodedJson.map((p) => Pet.fromJson(p)).toList();

      return pets;
    } on DioError catch (ex) {
      String errorMessage = json.decode(ex.response.toString())["errorMessage"];
      throw Exception(errorMessage);
    }
  }
}
