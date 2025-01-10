import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:http/http.dart' as http;

import '../models/product_model.dart';
import '../repository/product_repository.dart';

part 'product_event.dart';

part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductRepository productRepository;

  ProductBloc(this.productRepository) : super(ProductLoadingState()) {
    on<ProductEvent>((event, emit) async {
      try {
        emit(ProductLoadingState());
        var data = await productRepository.getProducts();
        emit(ProductLoadedState(data));
      } catch (e) {
        emit(ProductErrorState(e.toString()));
      }
    });
  }
}
