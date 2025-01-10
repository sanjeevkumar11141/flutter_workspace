import 'package:flutter_networking_response_exception_handling/models/product.dart';

import '../networking/ApiBaseHelper.dart';

class ProductRepository {
  ApiBaseHelper _helper = ApiBaseHelper();

  Future<Product> getProduct(String productId) async {
    final response = await _helper.get("products/$productId");
    return Product.fromJson(response);
  }
}