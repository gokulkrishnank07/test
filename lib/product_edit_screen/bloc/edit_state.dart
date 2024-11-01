
import 'package:machine_test/product_list_screen/model/product.dart';

abstract class EditState {
  @override
  List<Object> get props => [];
}

class ProductInitial extends EditState {}

class ProductLoading extends EditState {}

class ProductLoaded extends EditState {
  final Product product;

  ProductLoaded(this.product);

  @override
  List<Object> get props => [product];
}

class ProductUpdated extends EditState {
  final Product product;

  ProductUpdated(this.product);

  @override
  List<Object> get props => [product];
}

class ProductError extends EditState {
  final String message;

  ProductError(this.message);

  @override
  List<Object> get props => [message];
}
