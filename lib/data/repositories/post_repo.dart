import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

// import 'package:dio/dio.dart';
// import 'package:doclense/data/api/api.dart';

class PostRepository {
  // API api = API();
  // void fetchPosts() async {
  //   try {
  //     Response response = await api.sendRequest.get("/posts");
  //     log("Response---${response.data}");
  //   } catch (ex) {
  //     throw ex;
  //   }
  // }
}

Future<Map<String, dynamic>> getUserListApi() async {
  try {
    Response response = await http.get(
        Uri.parse("http://165.73.252.89/development/api/v1/skills"),
        headers: {
          "Accept": "application/json",
          "Authorization":
              "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIyIiwianRpIjoiNDE3ODYwOTRmZmI4NzU1NDU4M2VkYWZlY2ZlZGNhMDE2MDg3MjUxZmNmMWRmZTAyNTg1ZjljMThkZDVmYzg4ZGNmNzQ3ZDE0NmJjYThlYjYiLCJpYXQiOjE3MDc0NzUwODIuOTY3MzU2LCJuYmYiOjE3MDc0NzUwODIuOTY3MzU5LCJleHAiOjE3MDg3NzEwODIuOTQ0Mzc2LCJzdWIiOiIyODYiLCJzY29wZXMiOltdfQ.jNEM09lrD_4AHkZ45hph7B-AEKAdYzwLTpM9_8OUonsT3vHayn1nTs0uxKuqWTMApIrnRDUNdPkuwIGt6mXy_zyXoEn11JgbgDKYlUaxwAQ6HkBc3t0C4Hn-ehGpTgS0fBCjne48eUJ7EoRQKfrKd-3jZ_BM_GxtrZyhwbjST7lw0x-AD69WinSmyX0jAC110ac_FrR1UEJm-LI1kKj8JP1IB0qsu6sKe7PUnFc7O03OjLOospTP_1Zhnn_H8Wb7hTjdHYdlqIsEOFeqz_lAyxOG1e9tASRL3jbFjGeCk9rXncV85CnDmrKWZiRRoeKULcpM6VEZktw2liXx57O5mU9Dd_wizcCs5itvtRn0Wx66lXgyGSb-0J07n0KhvNZwVmhWjwvCvHSs6qJH0zjc570nQYt1efwjPXL5uDGla5zmyR_s19xVqPPHUMbRJuKAeEhmFv1Z6CLOEier4b_VV7BpblXYx0ip9Jtc0ochFBn5I8rg4E5ZESqJ5Vb5sar8Cq1xgr8n1jdnM4GaR_KjnBWY9ibwLeinVZAS-XMkFToNcx5vteArNV3AdO3ULFKfXtkh4cGeOBI5EIOIwQK_r9fN6H_e0J9lAY8Kt_gm0sexxRj5f4lL9tY4lkhtNXasZcqQSIItVhFAaMM0zwPc_m8kh6QDlJCZKUSojn1cXys"
        });

    if (response.statusCode == 200) {
      var responseBody = jsonDecode(response.body);
      return responseBody;
    } else {
      var responseBody = jsonDecode(response.body);
      return responseBody;
    }
  } catch (e) {
    log("Error:: ${e}");
  }
  return {};
}
