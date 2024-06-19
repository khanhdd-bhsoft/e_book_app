import 'dart:convert';

import 'package:e_book/config/app_config.dart';
import 'package:e_book/core/enum/search_field.dart';
import 'package:e_book/features/core_feature/data/models/volume/volume.dart';
import 'package:e_book/features/core_feature/data/models/volumes_model.dart';
import 'package:http/http.dart' as http;

import '../models/volume/item.dart';

class VolumeDataSource {
  Future<Volume?> searchVolumeByText(String searchKey, int page) async {
    try {
      String url =
          "${AppConfigs.baseURL}/volumes?q=${searchKey}&maxResults=${AppConfigs.maxResults}&key=${AppConfigs.apiKey}&page=${page}";
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body) as Map<String, dynamic>;
        Volume volumesModel = Volume.fromJson(jsonData);
        return volumesModel;
      }
    } catch (e) {
      print("An error has occurred: ${e.toString()}");
    }
  }

  Future<Volume?> searchVolumeByTextAndParam(
      String searchKey, SearchField searchField, int page) async {
    try {
      String url =
          "${AppConfigs.baseURL}/volumes?q=${searchKey}&maxResults=${AppConfigs.maxResults}&key=${AppConfigs.apiKey}+${searchField.name}&page=${page}";
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body) as Map<String, dynamic>;
        Volume volumesModel = Volume.fromJson(jsonData);
        return volumesModel;
      }
    } catch (e) {
      print("An error has occurred: ${e.toString()}");
    }
  }

  Future<Item?> getDetailVolumeItem(String id) async {
    try {
      String url = "${AppConfigs.baseURL}/volumes/${id}";
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body) as Map<String, dynamic>;
        Item volumesModel = Item.fromJson(jsonData);
        return volumesModel;
      }
    } catch (e) {
      print("An error has occurred: ${e.toString()}");
    }
  }
}
