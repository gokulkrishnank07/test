import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:machine_test/product_edit_screen/bloc/edit_event.dart';
import 'package:machine_test/product_edit_screen/bloc/edit_state.dart';
import 'package:machine_test/product_list_screen/model/product.dart';

class EditBloc extends Bloc<EditEvent, EditState> {
  EditBloc() : super(ProductLoading());

  @override
  Stream<EditState> mapEventToState(EditEvent event) async* {
    if (event is FetchProduct) {
      yield ProductLoaded(
        product: Product(
          id: event.productId,
          title: 'Sample Product',
          description: 'Sample Description',
          price: 0.0,
          image: 'https://via.placeholder.com/150',
        ),
      );
    } else if (event is UpdateProductUI) {
      yield ProductUpdated(Product: event.updatedProduct);
    }
  }
}
