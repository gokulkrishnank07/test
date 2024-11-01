import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';
import 'package:machine_test/product_list_screen/bloc/product_detials/pruduct_state.dart';
import 'package:machine_test/product_list_screen/model/product.dart';
import 'product_event.dart';


class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final Dio _dio = Dio();

  ProductBloc() : super(ProductLoading()) {
    on<FetchProducts>(_onFetchProducts);
  }

  Future<void> _onFetchProducts(FetchProducts event, Emitter<ProductState> emit) async {
    emit(ProductLoading());
    try {
      final response = await _dio.get('https://dummyjson.com/products');
      final List<Product> products = (response.data['products'] as List)
          .map((json) => Product.fromJson(json))
          .toList();
      emit(ProductLoaded(products));
    } catch (e) {
      emit(ProductError("Failed to load products"));
    }
  }
}
