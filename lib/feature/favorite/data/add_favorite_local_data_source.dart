

import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:qbooking/constant/key_storage_constant.dart';
import 'package:qbooking/feature/homepage/data/model/room_model_one_model.dart';

abstract class  AddFavoriteLocalDataSource{
  Future<void> saveFavorite(RoomModel roomModel);
  Future<RoomModel> getFavorite();
  Future<void> deleteFavorite();
}

class AddFavoriteLocalDataSourceImp implements AddFavoriteLocalDataSource{
  final FlutterSecureStorage _storage;

  AddFavoriteLocalDataSourceImp(this._storage);
  @override
  Future<void> deleteFavorite() {
    // TODO: implement deleteFavorite
    throw UnimplementedError();
  }

  @override
  Future<RoomModel> getFavorite() async {
    final roomData = await _storage.read(key: KeyStorageConstant.favoriteRooms) ?? jsonEncode(RoomModel());
    return RoomModel.fromJson(jsonDecode(roomData));

  }

  @override
  Future<void> saveFavorite(RoomModel roomModel) async {
    final roomData = jsonEncode(roomModel);
    await _storage.write(key: KeyStorageConstant.favoriteRooms, value: roomData);
  
  }
}