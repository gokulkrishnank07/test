import 'package:machine_test/product_list_screen/bloc/product_detials/product_event.dart';
import 'package:machine_test/product_list_screen/model/product.dart';

class ProductLoading extends ProductState {}

class ProductLoaded extends ProductState {
  final List<Product> products;
  ProductLoaded(this.products);
}

class ProductError extends ProductState {
  final String message;
  ProductError(this.message);
}