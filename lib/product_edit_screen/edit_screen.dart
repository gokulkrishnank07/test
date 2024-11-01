import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:machine_test/product_edit_screen/bloc/edit_bloc.dart';
import 'package:machine_test/product_edit_screen/bloc/edit_event.dart';
import 'package:machine_test/product_edit_screen/bloc/edit_state.dart';
import 'package:machine_test/product_edit_screen/product_edit_service/product_edit_repo.dart';
import 'package:machine_test/product_list_screen/model/product.dart';
import 'package:machine_test/product_list_screen/widget/customfont.dart';

class EditScreen extends StatelessWidget {
  final int productId;
  final EditBloc productBloc = EditBloc(ProductRepository());

  EditScreen({required this.productId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => productBloc..add(FetchProduct(productId)),
      child: Scaffold(
        appBar: AppBar(
            title: Text(
          "Product Details",
          style: CustomFont().appbarText,
        )),
        body: BlocBuilder<EditBloc, EditState>(
          builder: (context, state) {
            if (state is ProductLoading) {
              return Center(child: CircularProgressIndicator());
            } else if (state is ProductLoaded || state is ProductUpdated) {
              Product product = (state is ProductLoaded)
                  ? state.product
                  : (state as ProductUpdated).product;
              return ProductDetailForm(product: product);
            } else if (state is ProductError) {
              return Center(child: Text(state.message));
            }
            return Container();
          },
        ),
      ),
    );
  }
}

class ProductDetailForm extends StatefulWidget {
  final Product product;

  const ProductDetailForm({required this.product});

  @override
  _ProductDetailFormState createState() => _ProductDetailFormState();
}

class _ProductDetailFormState extends State<ProductDetailForm> {
  late TextEditingController titleController;
  late TextEditingController descriptionController;
  late TextEditingController priceController;

  @override
  void initState() {
    super.initState();
    titleController = TextEditingController(text: widget.product.title);
    descriptionController = TextEditingController(text: widget.product.description);
    priceController = TextEditingController(text: widget.product.price.toString());
  }

  @override
  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
    priceController.dispose();
    super.dispose();
  }

  void _saveChanges() {
    Product updatedProduct = widget.product.copyWith(
      title: titleController.text,
      description: descriptionController.text,
      price: double.tryParse(priceController.text) ?? widget.product.price,
    );
    context.read<EditBloc>().add(UpdateProductUI(updatedProduct));
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 250,
              width: 250,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey[200],
              ),
              child: Image.network(
                widget.product.image,
                fit: BoxFit.cover,
              ),
            ),
            TextField(
              controller: titleController,
              style: CustomFont().titleText,
              decoration: InputDecoration(labelText: "Title"),
            ),
            TextField(
              maxLines: 6,
              controller: descriptionController,
              style: CustomFont().bodyText,
              decoration: InputDecoration(labelText: "Description"),
            ),
            TextField(
              controller: priceController,
              style: CustomFont().bodyText,
              decoration: InputDecoration(labelText: "Price"),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              style: ButtonStyle(),
              onPressed: _saveChanges,
              child: Text("Save Changes"),
            ),
          ],
        ),
      ),
    );
  }
}


