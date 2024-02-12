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
    "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIyIiwianRpIjoiZDA1ZWZmMTAxMWJlMjYwNjBkYWMxODZjNjdjY2UzZGYwMjU2MWRmNzg1NzRlNTc0Mzk3YzI2MjhjYmI4MDI5ZGNlZWJiMTYwMWNkNjA3NzgiLCJpYXQiOjE3MDc3MjEyMjIuMDMwMzgsIm5iZiI6MTcwNzcyMTIyMi4wMzAzODUsImV4cCI6MTcwOTAxNzIyMS45Mjk4Niwic3ViIjoiMjg2Iiwic2NvcGVzIjpbXX0.vA1yB9y_2DIpFNeRCMyyKUROdNZElMbylTA2MMOtfY5h3ixHufu2mesBs9G7SAdNHAgYdapyMSKYl4As0ieSt8E0jvLrQAOFadzbCDpm4sYjP8Ee9yHzwSCGNqtMJ-ppYZnQ2c2PjM8W722ogOOK13uZ60lgHyxucmc1jQqEASebKBkGXpUa5iYsHzUK-vE51Ew9ZYd62tOj0drBgDUTNN99o4pgI5-AvgscNYii7ObZ9oOmusrmoSUHfl3JCqASAOSIGFUYP_lJbSIQ8upRvPHF9kT53GazF8zWer0rQnQcsqYgP-4VOeFCCNMCllp2b27nZc6IEdVUuXUMy7GrWuYhw5FHiYQG3jS7PNb0NNe1JcYDDkvju4cCYvAKJ0rLBlhjFrU1WYN7FrwQchBAe3SvOhjeGN3xMz1QC3ZjatYeVeOmlhoqM02At1MTwn_EJGze3TFzj8iQuPHiyfRgBxzN16WSRGqpTIDKtVktrr3dsMzInHkb9m6HeX2gwebD-40RyHSg89yekU821MKPGeuUHDpow9krIehXGY-3GneoJNzBJkFl8f98HLv64cPWYjr04ls2l-vI2bTnjeMDlff8LesfCq6woCosBlwrgVuYoyUbef3u0z-nOycUKqZE_ekodOSlQUYfdXTD3GeKp5W_RsNLrLP3fHZVnRGlugc";

Future<Map<String, dynamic>> getUserListApi() async {
  try {
    Response response = await http.get(
        Uri.parse("http://165.73.252.89/development/api/v1/skills"),
        headers: {
          "Accept": "application/json",
          "Authorization": "Bearer $accessToken"
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

Future<Map<String, dynamic>> updateUserprofile(
    String firstname, String lastname, String email, String path) async {
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
