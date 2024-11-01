import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:machine_test/product_list_screen/bloc/product_detials/product_bloc.dart';
import 'package:machine_test/product_list_screen/bloc/product_detials/product_event.dart';
import 'package:machine_test/product_list_screen/bloc/product_detials/pruduct_state.dart';
import 'package:machine_test/product_list_screen/widget/customfont.dart';
import 'package:machine_test/product_list_screen/widget/product_card.dart';

class ProductListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductBloc()..add(FetchProducts()),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Marketplace',
            style: CustomFont().appbarText,
          ),
          backgroundColor: Colors.white,
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black),
          actions: [
            IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: () {},
            ),
          ],
        ),
        body: BlocBuilder<ProductBloc, ProductState>(
          builder: (context, state) {
            if (state is ProductLoading) {
              return Center(child: CircularProgressIndicator());
            } else if (state is ProductLoaded) {
              return ListView(
                padding: EdgeInsets.symmetric(horizontal: 16),
                children: [
                  Text(
                    'Discover our exclusive products',
                    style: CustomFont().titleText,
                  ),
                  SizedBox(height: 4),
                  Text(
                    'In this marketplace, you will find various technics in the cheapest price',
                    style: CustomFont().labelText,
                  ),
                  Text(
                    "Show All",
                    textAlign: TextAlign.right,
                    style: TextStyle(
                        color: Color(0xFF06579A),
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(height: 15),
                  SizedBox(
                    height: 230,
                    child: GridView.builder(
                      padding: EdgeInsets.all(2),
                      scrollDirection: Axis.horizontal,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 1,
                        mainAxisExtent: 157,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 100,
                      ),
                      itemCount: state.products.length,
                      itemBuilder: (context, index) {
                        final product = state.products[index];
                        return ProductCard(product: product);
                      },
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    "Trending Item's",
                    style: CustomFont().appbarText,
                  ),
                  SizedBox(height: 4),
                  Text(
                    'In this marketplace, you will find various technics in the cheapest price',
                    style: CustomFont().labelText,
                  ),
                  Text(
                    "Show All",
                    textAlign: TextAlign.right,
                    style: TextStyle(
                        color: Color(0xFF06579A),
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(height: 15),
                  SizedBox(
                    height: 230,
                    child: GridView.builder(
                      padding: EdgeInsets.all(2),
                      scrollDirection: Axis.horizontal,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 1,
                        mainAxisExtent: 157,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 100,
                      ),
                      itemCount: state.products.length,
                      itemBuilder: (context, index) {
                        final product = state.products[index];
                        return ProductCard(product: product);
                      },
                    ),
                  ),
                  SizedBox(height: 25)
                ],
              );
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
