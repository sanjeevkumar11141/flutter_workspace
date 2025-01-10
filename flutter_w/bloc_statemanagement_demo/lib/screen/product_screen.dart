import 'package:bloc_statemanagement_demo/screen/product_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/product_bloc.dart';
import '../models/product_model.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  void initState() {
    context.read<ProductBloc>().add(ProductLoadedEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // return Scaffold(
    //   appBar: AppBar(
    //     title: const Text('Product Screen'),
    //   ),
    //   body: BlocBuilder<ProductBloc, ProductState>(
    //     builder: (context, state) {
    //       if (state is ProductLoadingState) {
    //         return const Center(
    //           child: CircularProgressIndicator.adaptive(),
    //         );
    //       } else if (state is ProductLoadedState) {
    //         return ListView.builder(
    //           itemCount: state.products.length,
    //           itemBuilder: (context, index) {
    //             return ProductListItem(product: state.products[index]);
    //           },
    //         );
    //       } else if (state is ProductErrorState) {
    //         return Center(
    //           child: Text(state.message),
    //         );
    //       } else {
    //         return const SizedBox();
    //       }
    //     },
    //   ),
    // );

    return Scaffold(
      body: BlocBuilder<ProductBloc, ProductState>(
        builder: (context, state) {
          if (state is ProductLoadingState) {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          } else if (state is ProductLoadedState) {
            return CustomScrollView(
              slivers: <Widget>[
                const SliverAppBar(
                  title: Text('Product Screen'),
                  floating: true,
                  snap: true,
                  backgroundColor: Colors.blue, // Ensure AppBar has a background color
                  elevation: 4.0, // Add elevation to avoid blending
                  expandedHeight: 0.0, // If you don't need an expanded height, keep it at 0.0
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                        (BuildContext context, int index) {
                      return ProductListItem(product: state.products[index]);
                    },
                    childCount: state.products.length,
                  ),
                ),
              ],
            );
          } else if (state is ProductErrorState) {
            return Center(
              child: Text(state.message),
            );
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}
