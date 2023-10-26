import 'package:aqary_test/features/1_builder_pattern/models/product_model.dart';
import 'package:flutter/material.dart';

class ProductDisplay extends StatelessWidget {
  final Product? product;

  const ProductDisplay({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text('Name: ${product?.name ?? ""}'),
        Text('Description: ${product?.description ?? ''}'),
        Text('Price: \$${product?.price.toStringAsFixed(2) ?? ''}'),
      ],
    );
  }
}
