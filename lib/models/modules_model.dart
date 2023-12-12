import 'package:chatgptclone/services/api_services.dart';
import 'package:flutter/material.dart';

class ModelsModel {
  final String? id;
  final int? created;
  final String? root;

  ModelsModel({
    required this.id,
    required this.root,
    required this.created,
  });

  factory ModelsModel.fromJson(Map<String, dynamic> json) => ModelsModel(
        id: json["id"],
        root: json["root"],
        created: json["created"],
      );

  static List<ModelsModel> modelsFromSnapshot(List modelSnapshot) {
    return modelSnapshot.map((data) => ModelsModel.fromJson(data)).toList();
  }
}

class ModelsProvider with ChangeNotifier {
  String currentModel = "text-davinci-003";
  String get getCurrentModel {
    return currentModel;
  }

  void setCurrentModel(String model) {
    currentModel = model;
    notifyListeners();
  }

  List<ModelsModel> modelList = [];
  List<ModelsModel> get getModelList {
    return modelList;
  }

  Future<List<ModelsModel>> getAllModels() async {
    modelList = await ApiServices.getModels();
    return modelList;
  }
}
