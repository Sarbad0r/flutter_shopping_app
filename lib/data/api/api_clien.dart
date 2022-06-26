import 'package:get/get.dart';

class ApiClient extends GetConnect implements GetxService {
  late String? token;
  String appBaseUr;
  late Map<String, String> _mainHeaders;
  ApiClient({required this.appBaseUr, this.token}) {
    baseUrl = appBaseUr;
    //this field says
    timeout = Duration(seconds: 30);
    _mainHeaders = {
      //server knows that the result would be in json format and data would send in utf8 dcode
      'Content-type': 'application/json; charset=UTF-8',
      //when we do a lot of post requests we shoud to send token from our phone
      'Authorization': 'Bearer $token'
    };
  }

  Future<Response> getData(String uri) async {
    try {
      Response response = await get(uri);
      return response;
    } catch (e) {
      return Response(statusCode: 1, statusText: e.toString());
    }
  }
}
