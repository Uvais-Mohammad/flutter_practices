import 'package:aqary_test/features/builder_pattern/models/product_builder.dart';
import 'package:aqary_test/features/builder_pattern/models/product_model.dart';
import 'package:aqary_test/features/builder_pattern/widgets/product_display.dart';
import 'package:aqary_test/features/builder_pattern/widgets/product_form.dart';
import 'package:aqary_test/features/builder_pattern/widgets/product_list.dart';
import 'package:flutter/material.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  
  ProductBuilder builder = ProductBuilder();
  Product? product;
  List<Product> products = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Builder Pattern Flutter'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ProductForm(builder: builder),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  product = builder.build();
                  products.add(product!);
                });
              },
              child: const Text('Create Product'),
            ),
            ProductDisplay(product: product),
            ProductList(products: products),
          ],
        ),
      ),
    );
  }
}
