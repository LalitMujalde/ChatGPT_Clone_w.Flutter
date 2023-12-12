import "dart:convert";
import "dart:developer";
import "dart:io";

import "package:flutter/material.dart";
import "package:http/http.dart" as http;
import "../constants/api_consts.dart";
import '../models/modules_model.dart';

class ApiServices {
  static Future<List<ModelsModel>> getModels() async {
    try {
      var response = await http.get(Uri.parse("$BASE_URI/models"),
          headers: {'Authorization': 'Bearer $API_KEY'});

      Map jsonResponse = jsonDecode(response.body);
      if (jsonResponse['error'] != null) {
        throw HttpException(jsonResponse['error']['message']);
      }

      // print("JsonResponse: $jsonResponse");
      List temp = [];
      for (var value in jsonResponse["data"]) {
        temp.add(value);
        // log("temp ${value["id"]}");
      }
      return ModelsModel.modelsFromSnapshot(temp);
    } catch (e) {
      log("error $e");
      rethrow;
    }
  }

  // Send message
  static Future<void> sendMessage(
      {required String message, required String modelId}) async {
    try {
      var response = await http.post(
        Uri.parse("$BASE_URI/completions"),
        headers: {
          'Authorization': 'Bearer $API_KEY',
          'Content-Type': 'application/json',
        },
        body: jsonEncode(
            {"model": modelId, "prompt": message, "max_tokens": 5}),
      );

      Map jsonResponse = jsonDecode(response.body);
      if (jsonResponse['error'] != null) {
        throw HttpException(jsonResponse['error']['message']);
      }

      if (jsonResponse["choices"].length > 0) {
        log("jsonResponse[choices]text ${jsonResponse["choices"][0]["text"]}");
      }
    } catch (e) {
      log("error $e");
      rethrow;
    }
  }
}
