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

String accessToken =
    "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIyIiwianRpIjoiY2ZlNmI4YmQ4MjViN2QyYTRmODNmMmRlZjQ2NjU0N2U0YzNjZmJkMDI5NjE3Mzg4ODAzMWQ5NmNmZDk4YWI3MGUyNDVhYTMxOWZjYjE2ZjciLCJpYXQiOjE3MDc4MDA1NDQuMDQxODkyLCJuYmYiOjE3MDc4MDA1NDQuMDQxODk3LCJleHAiOjE3MDkwOTY1NDQuMDExMjc4LCJzdWIiOiIyODUiLCJzY29wZXMiOltdfQ.DCfm-S5_NzLJTBhNivh7BCK7s_A2dwyxpuAiKEe4IkZngj2j3G_Iq06hk5m2ltsYy9X5ecrh_Uz_DUoUkHiqTtmG1KXDW9CUG_wFlc_-fp7-agZ2kOWXPPL8zx3NYY7REnKXWsKrZRU-tbxn8h4cimjtMsAZsaVuBD7zgDKK8PDEhTfTPVTQCUMJaTfQkliZBVnG43FBC0N8OvD2hxQcNf-kh5fh_Pli_Tzuv6PgjZU36Nc0NR9tmrsNr0sLJu-JqJn1zLovilLZ0XYdlJGKukz3_WxxsX01tnK9WC8NnHRi0qlZV67MdovvsKoq6F5j6AGJ0NOVl84YtKo9t3_usYrq-Z6m5viSJtQU6g22j4qKrdPsFbuavdY7o58apJJAOCXxvar9bIiIs_XP0GtIYLSrsQ_OCXTmqrCzzCTLQrB1WZvuxi2-gToofS8s_jwbd_bLbSZ56amb_QSB_HQ70PCF99cpbdGsLWBzOemjXf6iUnGSXuyAlsCGnJNp-aFZIQj2Z6GueYsgLywMnLhfWvhbRRbVY1nRCVMSUhvKCQPMz1nn5TFVZuw0qd_2upWJ81GSXLwgq1fMGeaR4rcY85Z076c1RPgHG9rSig42SBDIJTP4TzmwJbWQIGSNfu84yHhqWDCR4c57sS9-e871Pkv0yshsCNjTKQxhBf99daUsss";

Future<Map<String, dynamic>> getUserListApi() async {
  try {
    Response response = await http.get(
        Uri.parse("http://165.73.252.89/development/api/v1/skills"),
        headers: {
          "Accept": "application/json",
          "Authorization": "Bearer $accessToken"
        });

    if (response.statusCode == 200) {
      log("Success----");
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

Future<Map<String, dynamic>> updateUserprofile(
    String firstname, String lastname, String email, String path) async {
  log("message---------------");
  try {
    var body = <String, String>{
      'first_name': firstname,
      'last_name': lastname,
      'email': email,
      'skills[0]': '6'
    };
    var request = http.MultipartRequest('POST',
        Uri.parse("http://165.73.252.89/development/api/v1/engineer/profile"));

    request.fields.addAll(body);
    if (path.isNotEmpty) {
      request.files.add(await http.MultipartFile.fromPath('image', path));
    }

    request.headers.addAll(
        {"Accept": "application/json", "Authorization": "Bearer $accessToken"});

    StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      log("Success message------------");
      var responseBody = jsonDecode(await response.stream.bytesToString());
      return responseBody;
    } else {
      var responseBody = jsonDecode(await response.stream.bytesToString());
      return responseBody;
    }
  } catch (e) {
    log("Error:: ${e}");
  }
  return {};
}
