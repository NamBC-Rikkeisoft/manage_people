

import 'package:manage_peoples/api/result.dart';

abstract class BaseController<T> {
    Future<List<T>> getAllData(String url);
    Future<Result> createData(String url, Map<String,String> params);
}