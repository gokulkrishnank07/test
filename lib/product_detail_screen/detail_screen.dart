import 'package:flutter/material.dart';
import 'package:machine_test/product_edit_screen/edit_screen.dart';
import 'package:machine_test/product_list_screen/model/product.dart';
import 'package:machine_test/product_list_screen/widget/customfont.dart';

class ProductDetailPage extends StatelessWidget {
  final Product product;

  const ProductDetailPage({required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "Detail Screen",
          style: CustomFont().appbarText,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.edit, color: Colors.black),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EditScreen(productId: product.id),
                ),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Column(
                  children: [
                    Container(
                      height: 300,
                      width: 300,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.grey[200],
                      ),
                      child: Image.network(
                        product.image,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(height: 16),
                    Text(
                      "\$${product.price.toStringAsFixed(2)}",
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(product.title, style: CustomFont().titleText),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.pink[100],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      'Best Seller',
                      style: TextStyle(color: Colors.pink, fontSize: 10),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 5),
              Text('About the item', style: CustomFont().labelText),
              SizedBox(
                height: 5,
              ),
              Text("Brand : ${product.brand!}", style: CustomFont().subText),
              SizedBox(height: 16),
              Text(
                product.description,
                style: CustomFont().labelText,
              ),
              SizedBox(height: 16),
              Row(
                children: [
                  if (product.rating != null) ...[
                    Icon(Icons.star, color: Colors.yellow[700]),
                    SizedBox(width: 4),
                    Text(
                      product.rating!.toStringAsFixed(1),
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 20),
                  ],
                  if (product.stock != null) ...[
                    Align(
                      alignment: Alignment.bottomLeft,
                    ),
                    Icon(Icons.inventory, color: Colors.grey[700]),
                    SizedBox(width: 4),
                    Text(
                      'Stock: ${product.stock!.toInt()}',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(16),
        child: ElevatedButton.icon(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blueAccent,
            padding: EdgeInsets.symmetric(vertical: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          icon: const Icon(
            Icons.shopping_cart,
            color: Colors.white,
          ),
          label: Text('ADD TO CART', style: CustomFont().buttontext),
          onPressed: () {},
        ),
      ),
    );
  }
}
