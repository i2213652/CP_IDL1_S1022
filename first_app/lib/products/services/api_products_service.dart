import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:first_app/utils/constants.dart';
import 'package:first_app/utils/url_mixin.dart';

import 'package:first_app/products/services/iproduct_service.dart';

import 'package:first_app/products/models/error_service_model.dart';
import 'package:first_app/products/models/product_model.dart';

class APICourseService with UriMixin implements ICourseService {
  final http.Client client;
  final headers = {
    'Content-Type': 'application/json',
  };

  APICourseService(this.client);

  @override
  Future<List<Object>> getProducts(Map<String, dynamic>? queries) async {
    try {
      final url = getUri('course');
      var response = await http.get(url);
      final List<dynamic> jsonList = json.decode(response.body);
      return jsonList.map((item) => ProductModel.fromJson(item)).toList();
    } on ArgumentError {
      throw ErrorServiceModel(kParseError);
    } catch (exception) {
      throw ErrorServiceModel(kGenericError);
    }
  }
}
