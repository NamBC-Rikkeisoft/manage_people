import 'package:get/get.dart';
import 'package:manage_peoples/api/result.dart';
import 'package:http/http.dart' as http;

enum Method { GET, POST}

class ApiServiceBase extends GetConnect{
  Result _result = Result();

  Future<Result> callManualy({Method method = Method.GET, required String urlApi, required Map<String, String> param }) async {
    try {
        var res;
        if (method == Method.GET) {
          res = get(urlApi);
        } else if(method == Method.POST) {
          res = post(urlApi, param);
        }

        if (res.ok) {
          _result = Result.fromJson(res.body!);
          return _result;
        } else {
            // Log error
            return _result;
        }
    } catch (e) {
      // Log error
      return _result;
    }
  }

  Future<Result> getDataFromUrl({required String urlApi}) async {
      var res = await get(urlApi);
      if (res.isOk) {
        _result = Result.fromJson(res.bodyString!);
        return _result;
      }
      
      // Log error
      return _result;
  }

  Future<http.Response> getDataFromUrlWithResponse({required String urlApi}) async {
      return await http.get(Uri.parse(urlApi));
  }

  Future<Result> postDataFromUrl({required String urlApi, required Map<String, String> param }) async {
    try {
        var res = await post(urlApi, param);
            if (res.isOk) {
              _result = Result.fromJson(res.bodyString!);
                return _result;
            }

        // Log error
        return _result;
    } catch(e) {
      // Log error
      return _result;
    }
    
  }
}