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
  final Category? category;
  final Brand? brand;
  final List<RelatedProduct> relatedProducts;
  final String? importer;
  final String? origin;
  final int? ratingsCount;
  final int? ratingsValue;
  final List<String?> keyBenefits; // New field
  final List<String?> howToUse; // New field
  final List<String?> keyIngredients;

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
    required this.importer,
    required this.origin,
    required this.ratingsCount,
    required this.ratingsValue,
    required this.keyBenefits,
    required this.howToUse,
    required this.keyIngredients,
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
      brand: json['brand'] != null ? Brand.fromJson(json['brand']) : null,
      relatedProducts: (json['related'] as List<dynamic>)
          .map((related) => RelatedProduct.fromJson(related))
          .toList(),
      importer: json['importerDetails'] ?? 'Unknown',
      ratingsCount: json['ratingsCount'] ?? 0,
      ratingsValue: json['ratingsValue'] ?? 0,
      origin: json['originCountry'] ?? 'Unknown',
      keyBenefits: List<String>.from(json['keyBenefits'] ?? []), // Map field
      howToUse: List<String>.from(json['howToUse'] ?? []), // Map field
      keyIngredients: List<String>.from(json['keyIngredients'] ?? []),
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
      id: json['id'] ?? 0,
      small: json['small'] ?? 'unknown',
      medium: json['medium'] ?? 'unknown',
      big: json['big'] ?? 'unknown',
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
      id: json['id'] ?? 0,
      name: json['name'] ?? 'unknown',
      slug: json['slug'] ?? 'unknown',
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
      id: json['id'] ?? 0,
      name: json['name'] ?? 'unknown',
      image: json['image'] ?? 'unknown',
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
  final int? ratingsValue;

  RelatedProduct({
    required this.id,
    required this.name,
    required this.newPrice,
    required this.oldPrice,
    required this.discount,
    required this.images,
    required this.ratingsValue,
  });

  factory RelatedProduct.fromJson(Map<String, dynamic> json) {
    return RelatedProduct(
      id: json['id'] ?? 0,
      name: json['name'] ?? 'unknown',
      newPrice: json['newPrice'] ?? 0.0,
      oldPrice: json['oldPrice'] ?? 0.0,
      discount: json['discount'] ?? 0.0,
      images: (json['images'] as List<dynamic>)
          .map((image) => Images.fromJson(image))
          .toList(),
      ratingsValue: json['ratingsValue'] ?? 0,
    );
  }
}
