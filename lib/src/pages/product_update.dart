import 'package:flutter/material.dart';
import 'package:flutter_apps/src/dto/product_dto.dart';
import 'package:flutter_apps/src/services/product_service.dart';

class ProductUpdate extends StatefulWidget {
  const ProductUpdate({Key? key}) : super(key: key);

  @override
  State<ProductUpdate> createState() => _ProductUpdateState();
}

class _ProductUpdateState extends State<ProductUpdate> {
  final _formKey = GlobalKey<FormState>();
  late ProductDto productDto = ProductDto();

  @override
  Widget build(BuildContext context) {
    final ProductDto? productData = ModalRoute.of(context)!.settings.arguments as ProductDto?;

    if (productData != null) {
      print("Holaa $productData");
      productDto = productData;
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Product Actions"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: "Image URL",
                  ),
                  keyboardType: TextInputType.url,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter image URL";
                    }
                    return null;
                  },
                  onSaved: (value) {
                    productDto.imageUrl = value!;
                  },
                  initialValue: productDto.imageUrl,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: "Name",
                  ),
                  keyboardType: TextInputType.text,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter name";
                    }
                    return null;
                  },
                  onSaved: (value) {
                    productDto.name = value!;
                  },
                  initialValue: productDto.name,
                  enabled: false,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: "Price",
                  ),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter price";
                    }
                    return null;
                  },
                  onSaved: (value) {
                    productDto.price = double.parse(value!);
                  },
                  initialValue: productDto.price.toString(),
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: "Stock",
                  ),
                  keyboardType: TextInputType.phone,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter stock";
                    }
                    return null;
                  },
                  onSaved: (value) {
                    productDto.stock = int.parse(value!);
                  },
                  initialValue: productDto.stock.toString(),
                ),
                ElevatedButton(
                  onPressed: () => _addUpdateProduct(),
                  child: const Text("Save"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _addUpdateProduct() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      ProductService.updateProduct(productDto);
      Navigator.pop(context);
    }
  }
}
