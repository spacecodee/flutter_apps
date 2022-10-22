import 'package:flutter/material.dart';
import 'package:flutter_apps/src/dto/product_dto.dart';
import 'package:flutter_apps/src/services/product_service.dart';

class ProductAdd extends StatefulWidget {
  const ProductAdd({Key? key}) : super(key: key);

  @override
  State<ProductAdd> createState() => _ProductAddState();
}

class _ProductAddState extends State<ProductAdd> {
  final _formKey = GlobalKey<FormState>();
  late ProductDto productDto = ProductDto();

  @override
  Widget build(BuildContext context) {
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
      ProductService.addProduct(productDto);
      Navigator.pop(context);
    }
  }
}
