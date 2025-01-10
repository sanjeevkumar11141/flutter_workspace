import 'package:bloc_statemanagement_demo/models/product_model.dart';
import 'package:bloc_statemanagement_demo/screen/product_details_screen.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ProductListItem extends StatelessWidget {
  final ProductModel product;

  const ProductListItem({required this.product});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetailsScreen(product: product),
          ),
        );

      },
      child: Card(
        margin: EdgeInsets.all(10.0),
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Row(
            children: [
              // Check if the image URL is valid
              // CachedNetworkImage(
              //   imageUrl: product.image,
              //   height: 100,
              //   width: 100,
              //   fit: BoxFit.cover,
              //   placeholder: (context, url) => Image.asset(
              //     'assets/images/placeholder.png',
              //     height: 100,
              //     width: 100,
              //     fit: BoxFit.cover,
              //   ),
              //   errorWidget: (context, url, error) => Image.asset(
              //     'assets/images/placeholder.png',
              //     height: 100,
              //     width: 100,
              //     fit: BoxFit.cover,
              //   ),
              // ),

              FadeInImage.assetNetwork(
                placeholder: 'assets/images/placeholder.png', // Path to your placeholder image
                image: product.image,
                height: 100,
                width: 100,
                fit: BoxFit.cover,
                imageErrorBuilder: (context, error, stackTrace) {
                  return Image.asset(
                    'assets/images/placeholder.png',
                    height: 100,
                    width: 100,
                    fit: BoxFit.cover,
                  );
                },
              ),
              SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product!.title,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 10),
                    Text(
                      "\$${product.price}",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.green,
                      ),
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Icon(Icons.star, color: Colors.yellow, size: 16),
                        SizedBox(width: 5),
                        Text(
                          "${product.rating} (${product.rating?.count})",
                          style: TextStyle(fontSize: 14),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

