part of 'product_bloc.dart';

sealed class ProductEvent extends Equatable {
  const ProductEvent();
}

class ProductLoadedEvent extends ProductEvent{
  @override
  // TODO: implement props
  List<Object?> get props => [];

}
