import 'package:aqary_test/features/builder_pattern/models/product_model.dart';
import 'package:flutter/material.dart';

class ProductList extends StatefulWidget {
  const ProductList({
    super.key,
    required this.products,
  });

  final List<Product> products;

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: widget.products.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(widget.products[index].name),
            subtitle: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(widget.products[index].description),
                Text('\$${widget.products[index].price.toString()}'),
              ],
            ),
            trailing: IconButton(
              onPressed: () {
                setState(() {
                  widget.products.removeAt(index);
                });
              },
              icon: const Icon(Icons.delete),
            ),
          );
        },
      ),
    );
  }
}
