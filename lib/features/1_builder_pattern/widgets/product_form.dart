import 'package:aqary_test/features/1_builder_pattern/models/product_builder.dart';
import 'package:flutter/material.dart';

class ProductForm extends StatefulWidget {
  final ProductBuilder builder;

  const ProductForm({super.key, required this.builder});

  @override
  ProductFormState createState() => ProductFormState();
}

class ProductFormState extends State<ProductForm> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController priceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          controller: nameController,
          decoration: const InputDecoration(labelText: 'Name'),
          onChanged: (value) {
            widget.builder.name = value;
          },
        ),
        TextFormField(
          controller: descriptionController,
          decoration: const InputDecoration(labelText: 'Description'),
          onChanged: (value) {
            widget.builder.description = value;
          },
        ),
        TextFormField(
          controller: priceController,
          decoration: const InputDecoration(labelText: 'Price'),
          onChanged: (value) {
            widget.builder.price = double.tryParse(value) ?? 0.0;
          },
        ),
      ],
    );
  }
}
