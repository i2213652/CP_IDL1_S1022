import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:first_app/utils/constants.dart';
import 'package:first_app/utils/url_mixin.dart';

import 'package:first_app/products/services/iproduct_service.dart';

import 'package:first_app/products/models/error_service_model.dart';
import 'package:first_app/products/models/product_model.dart';

class APIProductService with UriMixin implements IProductService {
  final http.Client client;
  final headers = {
    'Content-Type': 'application/json',
  };

  APIProductService(this.client);

  @override
  Future<List<Object>> getProducts(Map<String, dynamic>? queries) async {
    try {
      final response = await http.get(Uri.parse('$client/product'));

      final List<dynamic> jsonList = json.decode(response.body);
      return jsonList.map((item) => ProductModel.fromJson(item)).toList();
    } on ArgumentError {
      throw ErrorServiceModel(kParseError);
    } catch (exception) {
      throw ErrorServiceModel(kGenericError);
    }
  }
}
