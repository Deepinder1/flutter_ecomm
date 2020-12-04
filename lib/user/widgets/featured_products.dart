import 'package:flutter/material.dart';
import 'package:flutter_ecom/user/provider/product.dart';
import 'package:flutter_ecom/user/widgets/featured_card.dart';
import 'package:provider/provider.dart';

class FeaturedProducts extends StatefulWidget {
  @override
  _FeaturedProductsState createState() => _FeaturedProductsState();
}

class _FeaturedProductsState extends State<FeaturedProducts> {
  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);
    return Container(
      height: (MediaQuery.of(context).size.height) - 200,
      child: GridView.builder(
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        scrollDirection: Axis.vertical,
        itemCount: productProvider.products.length,
        itemBuilder: (_, index) {
          return FeaturedCard(
            product: productProvider.products[index],
          );
        },
      ),
    );
  }
}
