import 'dart:convert';
import 'package:http/http.dart' as http;

Future<Product> fetchProduct(int id) async {
  final url =
      'https://attiveg.com:8443/api/products/$id'; // Replace with your actual API endpoint

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
    print(error);
    throw Exception('Error fetching product: $error');
  }
}

class Product {
  final int id;
  final String name;
  final String description;
  final double newPrice;
  final double oldPrice;
  final double discount;
  final List<Images> images;
  final Category category;
  final Brand brand;
  final List<RelatedProduct> relatedProducts;

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
      newPrice: json['newPrice'],
      oldPrice: json['oldPrice'],
      discount: json['discount'],
      description: json['description'],
      images: (json['images'] as List<dynamic>)
          .map((image) => Images.fromJson(image))
          .toList(),
      category: Category.fromJson(json['category']),
      brand: Brand.fromJson(json['brand']),
      relatedProducts: (json['related'] as List<dynamic>)
          .map((related) => RelatedProduct.fromJson(related))
          .toList(),
    );
  }
}

class Images {
  final int id;
  final String small;
  final String medium;
  final String big;

  Images({
    required this.id,
    required this.small,
    required this.medium,
    required this.big,
  });

  factory Images.fromJson(Map<String, dynamic> json) {
    return Images(
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

class RelatedProduct {
  final int id;
  final String name;
  final double newPrice;
  final double oldPrice;
  final double discount;
  final List<Images> images;

  RelatedProduct({
    required this.id,
    required this.name,
    required this.newPrice,
    required this.oldPrice,
    required this.discount,
    required this.images,
  });

  factory RelatedProduct.fromJson(Map<String, dynamic> json) {
    return RelatedProduct(
      id: json['id'],
      name: json['name'],
      newPrice: json['newPrice'],
      oldPrice: json['oldPrice'],
      discount: json['discount'],
      images: (json['images'] as List<dynamic>)
          .map((image) => Images.fromJson(image))
          .toList(),
    );
  }
}
