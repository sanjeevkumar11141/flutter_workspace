import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/product.dart';
import '../repository/product_repository.dart';


class ProductProvider with ChangeNotifier {
  Product? product;
  bool isLoading = false;

  final ProductRepository repository;

  ProductProvider(this.repository);

  Future<void> fetchProduct(String productId) async {
    isLoading = true;
    notifyListeners();
    try {
      product = await repository.getProduct(productId);
    } catch (e) {
      // Handle error
    }
    isLoading = false;
    notifyListeners();
  }
}

class ProductScreen extends StatelessWidget {
  final String productId;

  ProductScreen({required this.productId});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ProductProvider(ProductRepository())..fetchProduct(productId),
      child: Scaffold(
        appBar: AppBar(
          title: Consumer<ProductProvider>(
            builder: (context, provider, _) {
              return Text(provider.product?.title ?? 'Loading...');
            },
          ),
        ),
        body: Consumer<ProductProvider>(
          builder: (context, provider, _) {
            if (provider.isLoading) {
              return Center(child: CircularProgressIndicator());
            }

            if (provider.product == null) {
              return Center(child: Text('Error loading product'));
            }

            final product = provider.product!;
            return SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: double.infinity,
                    height: 200,
                    child: FadeInImage.assetNetwork(
                      placeholder: 'assets/images/placeholder.png',
                      image: product.images.first,
                      fit: BoxFit.fitWidth,
                      imageErrorBuilder: (context, error, stackTrace) {
                        return Image.asset(
                          'assets/images/placeholder.png',
                          fit: BoxFit.fitWidth,
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 16.0),
                  Text(
                    product.title,
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    '\$${product.price}',
                    style: TextStyle(fontSize: 20, color: Colors.green),
                  ),
                  SizedBox(height: 16.0),
                  Text(
                    product.description,
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 16.0),
                  Row(
                    children: [
                      FadeInImage.assetNetwork(
                        placeholder: 'assets/images/placeholder.png',
                        image: product.category.image,
                        width: 50,
                        height: 50,
                        fit: BoxFit.cover,
                        imageErrorBuilder: (context, error, stackTrace) {
                          return Image.asset(
                            'assets/images/placeholder.png',
                            width: 50,
                            height: 50,
                            fit: BoxFit.cover,
                          );
                        },
                      ),
                      SizedBox(width: 16.0),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            product.category.name,
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'Category ID: ${product.category.id}',
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 16.0),
                  Text(
                    'Created At: ${product.creationAt.toLocal()}',
                    style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
                  ),
                  Text(
                    'Updated At: ${product.updatedAt.toLocal()}',
                    style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
