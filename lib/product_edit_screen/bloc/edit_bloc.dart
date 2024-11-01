
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:machine_test/product_edit_screen/bloc/edit_event.dart';
import 'package:machine_test/product_edit_screen/bloc/edit_state.dart';
import 'package:machine_test/product_edit_screen/product_edit_service/product_edit_repo.dart';

class EditBloc extends Bloc<EditEvent, EditState> {
  final ProductRepository repository;

  EditBloc(this.repository) : super(ProductInitial()) {
    on<FetchProduct>(_onFetchProduct);
    on<UpdateProduct>(_onUpdateProduct);
  }

  Future<void> _onFetchProduct(
      FetchProduct event, emit) async {
    emit(ProductLoading());
    try {
      final product = await repository.fetchProductById(event.id);
      emit(ProductLoaded(product));
    } catch (e) {
      emit(ProductError('Failed to fetch product'));
    }
  }

  Future<void> _onUpdateProduct(
      UpdateProduct event, emit) async {
    emit(ProductLoading());
    try {
      final updatedProduct = await repository.updateProduct(event.id, event.data);
      emit(ProductUpdated(updatedProduct));
    } catch (e) {
      emit(ProductError('Failed to update product'));
    }
  }
}
