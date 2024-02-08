import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:doclense/data/api/api.dart';

class PostRepository {
  API api = API();
  void fetchPosts() async {
    try {
      Response response = await api.sendRequest.get("/posts");
      log("Response---${response.data}");
    } catch (ex) {
      throw ex;
    }
  }
}
