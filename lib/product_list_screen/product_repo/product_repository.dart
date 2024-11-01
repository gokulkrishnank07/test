
import 'package:dio/dio.dart';
import 'package:machine_test/product_list_screen/model/product.dart';
String notificationUrl = 'https://dummyjson.com/products';
  Dio user = Dio();

Future<List<Product>> fetchNotifications() async {
    try {
      final response = await user.get(
        notificationUrl,
        options: Options(
          headers: {
          
            'Content-Type': 'application/json',
          },
        ),
      );

      if (response.data['status'] == 'success') {
        List<dynamic> dataList = response.data['data'];
        return dataList
            .map((data) => Product.fromJson(data))
            .toList();
      } else {
        throw Exception('Failed to load notifications');
      }
    } catch (e) {
      throw Exception('Failed to fetch notifications: $e');
    }
  }