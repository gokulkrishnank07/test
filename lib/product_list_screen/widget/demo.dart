// import 'package:flutter/material.dart';

// class ProductGrid extends StatelessWidget {
//   final List<Product> products = [
//     Product(
//       imageUrl: 'https://example.com/headphones1.png',
//       name: 'Sony WH-1000XM4',
//       description: 'Wireless Industry Leading Noise Cancelling Overhead Headphones',
//       price: '\$299.99',
//     ),
//     Product(
//       imageUrl: 'https://example.com/headphones2.png',
//       name: 'Beats Studio3',
//       description: 'Wireless Noise Cancelling Over-Ear Headphones - Apple W1 Chip',
//       price: '\$241.69',
//     ),
//     // Add more products here
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Product Grid')),
//       body: Padding(
//         padding: EdgeInsets.all(16),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // Title Section
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text(
//                   'Headphones',
//                   style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//                 ),
//                 GestureDetector(
//                   onTap: () {
//                     // Handle 'Show All' action
//                   },
//                   child: Text(
//                     'Show All',
//                     style: TextStyle(color: Colors.blue),
//                   ),
//                 ),
//               ],
//             ),
//             SizedBox(height: 16),
//             // Horizontal GridView
//             Container(
//               height: 250, // Adjust based on your needs
//               child: GridView.builder(
//                 scrollDirection: Axis.horizontal,
//                 gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                   crossAxisCount: 1,
//                   mainAxisSpacing: 16,
//                   childAspectRatio: 0.7, // Adjust aspect ratio for card width/height
//                 ),
//                 itemCount: products.length,
//                 itemBuilder: (context, index) {
//                   return ProductCard(product: products[index]);
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class Product {
//   final String imageUrl;
//   final String name;
//   final String description;
//   final String price;

//   Product({
//     required this.imageUrl,
//     required this.name,
//     required this.description,
//     required this.price,
//   });
// }

// class ProductCard extends StatelessWidget {
//   final Product product;

//   const ProductCard({required this.product});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.all(12),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(16),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.1),
//             blurRadius: 10,
//             offset: Offset(0, 4),
//           ),
//         ],
//       ),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Align(
//             alignment: Alignment.topRight,
//             child: Icon(Icons.favorite_border, color: Colors.grey),
//           ),
//           SizedBox(height: 8),
//           Image.network(
//             product.imageUrl,
//             height: 80,
//             fit: BoxFit.cover,
//           ),
//           SizedBox(height: 8),
//           Text(
//             product.name,
//             style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
//             textAlign: TextAlign.center,
//           ),
//           SizedBox(height: 4),
//           Text(
//             product.description,
//             style: TextStyle(color: Colors.grey, fontSize: 12),
//             textAlign: TextAlign.center,
//             maxLines: 2,
//             overflow: TextOverflow.ellipsis,
//           ),
//           SizedBox(height: 8),
//           Text(
//             product.price,
//             style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
//           ),
//         ],
//       ),
//     );
//   }
// }

// void main() {
//   runApp(MaterialApp(
//     home: ProductGrid(),
//   ));
// }






// import 'package:flutter/material.dart';
// import 'package:machine_test/product_list_screen/model/product.dart';

// class ProductCard extends StatelessWidget {
//   final Product product;

//   ProductCard({required this.product});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: 180,
//       height: 500,
//       margin: EdgeInsets.only(right: 8),
//       padding: EdgeInsets.all(8),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(12),
//         color: Colors.white,
//         boxShadow: [
//           BoxShadow(
//             color: Colors.grey.withOpacity(0.1),
//             spreadRadius: 1,
//             blurRadius: 1,
//             offset: Offset(0, 1),
//           ),
//         ],
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Image.network(product.image, height: 80, fit: BoxFit.cover),
//           SizedBox(height: 8),
//           Text(
//             product.title,
//             style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//             maxLines: 1,
//             overflow: TextOverflow.ellipsis,
//           ),
//           SizedBox(height: 4),
//           Text(
//             '\$${product.price.toStringAsFixed(2)}',
//             style: TextStyle(color: Colors.green),
//           ),
//         ],
//       ),
//     );
//   }
// }
