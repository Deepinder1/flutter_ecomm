import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_ecom/business/db/product.dart';
import 'package:provider/provider.dart';
import 'package:flutter_ecom/business/providers/products_provider.dart';
import '../db/category.dart';
import '../db/brand.dart';

class AddProduct extends StatefulWidget {
  @override
  _AddProductState createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  CategoryService _categoryService = CategoryService();
  BrandService _brandService = BrandService();
  ProductService productService = ProductService();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController productNameController = TextEditingController();
  TextEditingController productColorController = TextEditingController();
  TextEditingController productSizeController = TextEditingController();
  TextEditingController quatityController = TextEditingController();
  final priceController = TextEditingController();
  List<DocumentSnapshot> brands = <DocumentSnapshot>[];
  List<DocumentSnapshot> categories = <DocumentSnapshot>[];
  List<DropdownMenuItem<String>> categoriesDropDown =
      <DropdownMenuItem<String>>[];
  List<DropdownMenuItem<String>> brandsDropDown = <DropdownMenuItem<String>>[];
  String _currentCategory;
  String _currentBrand;
  Color white = Colors.white;
  Color black = Colors.black;
  Color grey = Colors.grey;
  Color red = Colors.red;
  List<String> selectedSizes = <String>[];
  List<String> colors = <String>[];
  bool onSale = false;
  bool featured = false;

  File _image1;
  bool isLoading = false;

  @override
  void initState() {
    _getCategories();
    _getBrands();
  }

  List<DropdownMenuItem<String>> getCategoriesDropdown() {
    List<DropdownMenuItem<String>> items = new List();
    for (int i = 0; i < categories.length; i++) {
      setState(() {
        items.insert(
            0,
            DropdownMenuItem(
                child: Text(categories[i].data()['category']),
                value: categories[i].data()['category']));
      });
    }
    return items;
  }

  List<DropdownMenuItem<String>> getBrandosDropDown() {
    List<DropdownMenuItem<String>> items = new List();
    for (int i = 0; i < brands.length; i++) {
      setState(() {
        items.insert(
            0,
            DropdownMenuItem(
                child: Text(brands[i].data()['brand'] ?? 'Brand'),
                value: brands[i].data()['brand'] ?? 'Brand'));
      });
    }
    return items;
  }

  @override
  Widget build(BuildContext context) {
    final adminProductProvider = Provider.of<AdminProductProvider>(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0.1,
        backgroundColor: white,
        leading: IconButton(
          icon: Icon(Icons.close),
          color: black,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          "add product",
          style: TextStyle(color: black),
        ),
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: isLoading
              ? CircularProgressIndicator()
              : Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: 120,
                              child: OutlineButton(
                                  borderSide: BorderSide(
                                      color: grey.withOpacity(0.5), width: 2.5),
                                  onPressed: () {
                                    _selectImage(
                                      ImagePicker().getImage(
                                          source: ImageSource.gallery),
                                    );
                                  },
                                  child: _displayChild1()),
                            ),
                          ),
                        ),
                      ],
                    ),

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Enter a product name with 10 characters at maximum',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: red, fontSize: 12),
                      ),
                    ),

                    //add custom color
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: TextFormField(
                        controller: productColorController,
                        decoration:
                            InputDecoration(hintText: 'Add Custom color'),
                        validator: (value) {
                          if (value.isEmpty) {
                            value = 'Color';
                          } else {
                            if (adminProductProvider.selectedColors
                                .contains(value ?? 'Color')) {
                              adminProductProvider.removeColor(value);
                            } else {
                              adminProductProvider.addColors(value);
                            }
                          }
                        },
                      ),
                    ),

                    Text('Available Colors'),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: InkWell(
                            onTap: () {
                              if (adminProductProvider.selectedColors
                                  .contains('red')) {
                                adminProductProvider.removeColor('red');
                              } else {
                                adminProductProvider.addColors('red');
                              }
                              setState(() {
                                colors = adminProductProvider.selectedColors;
                              });
                            },
                            child: Container(
                              width: 24,
                              height: 24,
                              decoration: BoxDecoration(
                                  color: adminProductProvider.selectedColors
                                          .contains('red')
                                      ? Colors.blue
                                      : grey,
                                  borderRadius: BorderRadius.circular(15)),
                              child: Padding(
                                padding: const EdgeInsets.all(2),
                                child: CircleAvatar(
                                  backgroundColor: Colors.red,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: InkWell(
                            onTap: () {
                              if (adminProductProvider.selectedColors
                                  .contains('yellow')) {
                                adminProductProvider.removeColor('yellow');
                              } else {
                                adminProductProvider.addColors('yellow');
                              }
                              setState(() {
                                colors = adminProductProvider.selectedColors;
                              });
                            },
                            child: Container(
                              width: 24,
                              height: 24,
                              decoration: BoxDecoration(
                                  color: adminProductProvider.selectedColors
                                          .contains('yellow')
                                      ? red
                                      : grey,
                                  borderRadius: BorderRadius.circular(15)),
                              child: Padding(
                                padding: const EdgeInsets.all(2),
                                child: CircleAvatar(
                                  backgroundColor: Colors.yellow,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: InkWell(
                            onTap: () {
                              if (adminProductProvider.selectedColors
                                  .contains('blue')) {
                                adminProductProvider.removeColor('blue');
                              } else {
                                adminProductProvider.addColors('blue');
                              }
                              setState(() {
                                colors = adminProductProvider.selectedColors;
                              });
                            },
                            child: Container(
                              width: 24,
                              height: 24,
                              decoration: BoxDecoration(
                                  color: adminProductProvider.selectedColors
                                          .contains('blue')
                                      ? red
                                      : grey,
                                  borderRadius: BorderRadius.circular(15)),
                              child: Padding(
                                padding: const EdgeInsets.all(2),
                                child: CircleAvatar(
                                  backgroundColor: Colors.blue,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: InkWell(
                            onTap: () {
                              if (adminProductProvider.selectedColors
                                  .contains('green')) {
                                adminProductProvider.removeColor('green');
                              } else {
                                adminProductProvider.addColors('green');
                              }
                              setState(() {
                                colors = adminProductProvider.selectedColors;
                              });
                            },
                            child: Container(
                              width: 24,
                              height: 24,
                              decoration: BoxDecoration(
                                  color: adminProductProvider.selectedColors
                                          .contains('green')
                                      ? red
                                      : grey,
                                  borderRadius: BorderRadius.circular(15)),
                              child: Padding(
                                padding: const EdgeInsets.all(2),
                                child: CircleAvatar(
                                  backgroundColor: Colors.green,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: InkWell(
                            onTap: () {
                              if (adminProductProvider.selectedColors
                                  .contains('white')) {
                                adminProductProvider.removeColor('white');
                              } else {
                                adminProductProvider.addColors('white');
                              }
                              setState(() {
                                colors = adminProductProvider.selectedColors;
                              });
                            },
                            child: Container(
                              width: 24,
                              height: 24,
                              decoration: BoxDecoration(
                                  color: adminProductProvider.selectedColors
                                          .contains('white')
                                      ? red
                                      : grey,
                                  borderRadius: BorderRadius.circular(15)),
                              child: Padding(
                                padding: const EdgeInsets.all(2),
                                child: CircleAvatar(
                                  backgroundColor: white,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: InkWell(
                            onTap: () {
                              if (adminProductProvider.selectedColors
                                  .contains('black')) {
                                adminProductProvider.removeColor('black');
                              } else {
                                adminProductProvider.addColors('black');
                              }
                              setState(() {
                                colors = adminProductProvider.selectedColors;
                              });
                            },
                            child: Container(
                              width: 24,
                              height: 24,
                              decoration: BoxDecoration(
                                  color: adminProductProvider.selectedColors
                                          .contains('black')
                                      ? red
                                      : grey,
                                  borderRadius: BorderRadius.circular(15)),
                              child: Padding(
                                padding: const EdgeInsets.all(2),
                                child: CircleAvatar(
                                  backgroundColor: black,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),

                    //add custom size
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: TextFormField(
                        controller: productSizeController,
                        decoration:
                            InputDecoration(hintText: 'Add Custom size'),
                        validator: (value) {
                          if (value.isEmpty) {
                            value = 'Size';
                          } else {
                            if (selectedSizes.contains(value ?? 'XS')) {
                              return 'It already has this Size';
                            } else {
                              changeSelectedSize(value);
                            }
                          }
                        },
                      ),
                    ),

                    Text('Available Sizes'),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Checkbox(
                            value: selectedSizes.contains('S'),
                            onChanged: (value) => changeSelectedSize('S')),
                        Text('S'),
                        Checkbox(
                            value: selectedSizes.contains('M'),
                            onChanged: (value) => changeSelectedSize('M')),
                        Text('M'),
                        Checkbox(
                            value: selectedSizes.contains('L'),
                            onChanged: (value) => changeSelectedSize('L')),
                        Text('L'),
                        Checkbox(
                            value: selectedSizes.contains('XL'),
                            onChanged: (value) => changeSelectedSize('XL')),
                        Text('XL'),
                      ],
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Text('Sale'),
                            SizedBox(
                              width: 10,
                            ),
                            Switch(
                                value: onSale,
                                onChanged: (value) {
                                  setState(() {
                                    onSale = value;
                                  });
                                }),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Text('Show to User'),
                            //show to user == Featured
                            SizedBox(
                              width: 10,
                            ),
                            Switch(
                                value: featured,
                                onChanged: (value) {
                                  setState(() {
                                    featured = value;
                                  });
                                }),
                          ],
                        ),
                      ],
                    ),

                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: TextFormField(
                        controller: productNameController,
                        decoration: InputDecoration(hintText: 'Product name'),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'You must enter the product name';
                          } else if (value.length > 10) {
                            return 'Product name cant have more than 10 letters';
                          }
                        },
                      ),
                    ),

//              select category
                    Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Category: ',
                            style: TextStyle(color: red),
                          ),
                        ),
                        DropdownButton(
                          items: categoriesDropDown,
                          onChanged: changeSelectedCategory,
                          value: _currentCategory,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Brand: ',
                            style: TextStyle(color: red),
                          ),
                        ),
                        DropdownButton(
                          items: brandsDropDown,
                          onChanged: changeSelectedBrand,
                          value: _currentBrand.toString(),
                        ),
                      ],
                    ),

//
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: TextFormField(
                        controller: quatityController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          hintText: 'Quantity',
                        ),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'You must enter the product quantity';
                          }
                        },
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: TextFormField(
                        controller: priceController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          hintText: 'Price, Write in decimal format',
                        ),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'You must enter the product price';
                          }
                        },
                      ),
                    ),

                    FlatButton(
                      color: red,
                      textColor: white,
                      child: Text('Add product'),
                      onPressed: () {
                        validateAndUpload();
                      },
                    )
                  ],
                ),
        ),
      ),
    );
  }

  _getCategories() async {
    List<DocumentSnapshot> data = await _categoryService.getCategories();
    print(data.length);
    setState(() {
      categories = data;
      categoriesDropDown = getCategoriesDropdown();
      _currentCategory = categories[0].data()['category'];
    });
  }

  _getBrands() async {
    List<DocumentSnapshot> data = await _brandService.getBrands();
    print(data.length);
    setState(() {
      brands = data;
      brandsDropDown = getBrandosDropDown();
      _currentBrand = brands[0].data()['brand'];
    });
  }

  changeSelectedCategory(String selectedCategory) {
    setState(() => _currentCategory = selectedCategory);
  }

  changeSelectedBrand(String selectedBrand) {
    setState(() => _currentBrand = selectedBrand);
  }

  void changeSelectedSize(String size) {
    if (selectedSizes.contains(size)) {
      setState(() {
        selectedSizes.remove(size);
      });
    } else {
      setState(() {
        selectedSizes.insert(0, size);
      });
    }
  }

  void _selectImage(Future<PickedFile> pickImage) async {
    PickedFile tempImg = await pickImage;
    File tempImage = File(tempImg.path);
    setState(() => _image1 = tempImage);
  }

  Widget _displayChild1() {
    if (_image1 == null) {
      return Padding(
        padding: const EdgeInsets.fromLTRB(14, 50, 14, 50),
        child: new Icon(
          Icons.add,
          color: grey,
        ),
      );
    } else {
      return Image.file(
        _image1,
        fit: BoxFit.fill,
        width: double.infinity,
      );
    }
  }

  void validateAndUpload() async {
    if (_formKey.currentState.validate()) {
      setState(() => isLoading = true);
      if (_image1 != null) {
        if (selectedSizes.isNotEmpty) {
          String imageUrl1;

          final FirebaseStorage storage = FirebaseStorage.instance;
          final String picture1 =
              "1${DateTime.now().millisecondsSinceEpoch.toString()}.jpg";
          StorageUploadTask task1 =
              storage.ref().child(picture1).putFile(_image1);

          StorageTaskSnapshot snapshot1 =
              await task1.onComplete.then((snapshot) => snapshot);

          task1.onComplete.then((snapshot3) async {
            imageUrl1 = await snapshot1.ref.getDownloadURL();

            productService.uploadProduct({
              "name": productNameController.text,
              "price": double.parse(priceController.text),
              "sizes": selectedSizes,
              "colors": colors,
              "picture": imageUrl1,
              "quantity": int.parse(quatityController.text),
              "brand": _currentBrand,
              "category": _currentCategory,
              'sale': onSale,
              'featured': featured
            });
            _formKey.currentState.reset();
            setState(() => isLoading = false);
            Navigator.pop(context);
          });
        } else {
          setState(() => isLoading = false);
        }
      } else {
        setState(() => isLoading = false);

//        Fluttertoast.showToast(msg: 'all the images must be provided');
      }
    }
  }
}
