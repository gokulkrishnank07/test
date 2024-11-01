import 'package:machine_test/product_list_screen/model/product.dart';

abstract class EditEvent {}

class FetchProduct extends EditEvent {
  final int productId;
  FetchProduct(this.productId);
}

class UpdateProduct extends EditEvent {
  final int productId;
  final Map<String, dynamic> updatedData;
  UpdateProduct(this.productId, this.updatedData);
}

class UpdateProductUI extends EditEvent {
  final Product updatedProduct;
  UpdateProductUI(this.updatedProduct);
}
