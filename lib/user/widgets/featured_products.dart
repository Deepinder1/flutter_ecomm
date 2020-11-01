import 'package:flutter/material.dart';
import 'package:flutter_ecom/user/provider/product.dart';
import 'package:flutter_ecom/user/widgets/featured_card.dart';
import 'package:provider/provider.dart';

//TODO see if this is required or not
class FeaturedProducts extends StatefulWidget {
  @override
  _FeaturedProductsState createState() => _FeaturedProductsState();
}

class _FeaturedProductsState extends State<FeaturedProducts> {
  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);
    return Container(
      height: 230,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
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
