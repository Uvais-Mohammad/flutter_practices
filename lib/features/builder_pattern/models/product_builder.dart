import 'package:aqary_test/features/builder_pattern/models/product_model.dart';

class ProductBuilder {
  late String name;
  late String description;
  late double price;

  Product build() => Product(this);
}
