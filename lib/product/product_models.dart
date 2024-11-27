import 'dart:convert';

import 'package:http/http.dart' as http;

Future<Product> fetchProduct() async {
  const url =
      'https://your-api-endpoint.com/api/products'; // Replace with your actual API endpoint

  try {
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      final Product product = Product.fromJson(data);
      return product;
    } else {
      throw Exception(
          'Failed to fetch data. Status code: ${response.statusCode}');
    }
  } catch (error) {
    throw Exception('Error fetching product: $error');
  }
}

class Product {
  final int id;
  final String name;
  final String description;
  final double newPrice;
  final double oldPrice;
  final int discount;
  final List<Image> images;
  final Category category;
  final Brand brand;
  final List<Product> relatedProducts;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.newPrice,
    required this.oldPrice,
    required this.discount,
    required this.images,
    required this.category,
    required this.brand,
    required this.relatedProducts,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      newPrice: json['newPrice']?.toDouble() ?? 0.0,
      oldPrice: json['oldPrice']?.toDouble() ?? 0.0,
      discount: json['discount'] ?? 0,
      images: (json['images'] as List<dynamic>)
          .map((image) => Image.fromJson(image))
          .toList(),
      category: Category.fromJson(json['category']),
      brand: Brand.fromJson(json['brand']),
      relatedProducts: (json['related'] as List<dynamic>)
          .map((related) => Product.fromJson(related))
          .toList(),
    );
  }
}

class Image {
  final int id;
  final String small;
  final String medium;
  final String big;

  Image({
    required this.id,
    required this.small,
    required this.medium,
    required this.big,
  });

  factory Image.fromJson(Map<String, dynamic> json) {
    return Image(
      id: json['id'],
      small: json['small'],
      medium: json['medium'],
      big: json['big'],
    );
  }
}

class Category {
  final int id;
  final String name;
  final String slug;

  Category({
    required this.id,
    required this.name,
    required this.slug,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id'],
      name: json['name'],
      slug: json['slug'],
    );
  }
}

class Brand {
  final int id;
  final String name;
  final String image;

  Brand({
    required this.id,
    required this.name,
    required this.image,
  });

  factory Brand.fromJson(Map<String, dynamic> json) {
    return Brand(
      id: json['id'],
      name: json['name'],
      image: json['image'],
    );
  }
}
