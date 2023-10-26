import 'package:aqary_test/features/1_builder_pattern/models/product_builder.dart';

class Product {
  final String _name;
  final String _description;
  final double _price;

  String get name => _name;
  String get description => _description;
  double get price => _price;

  Product(ProductBuilder builder)
      : _name = builder.name ,
        _description = builder.description ,
        _price = builder.price ;
}
