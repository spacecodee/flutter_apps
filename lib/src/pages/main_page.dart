import 'package:flutter/material.dart';
import 'package:flutter_apps/src/dto/product_dto.dart';
import 'package:flutter_apps/src/services/product_service.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("Flutter Apps"),
            InkWell(
              child: const Icon(Icons.add),
              onTap: () => Navigator.pushNamed(context, "/add"),
            ),
          ],
        ),
      ),
      body: StreamBuilder<List<ProductDto>>(
        stream: ProductService.products,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey[200],
                  ),
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.network(snapshot.data![index].imageUrl, width: 140),
                      const SizedBox(width: 10),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Name: ${snapshot.data![index].name}"),
                          const SizedBox(height: 10),
                          Text("Price: ${snapshot.data![index].price}"),
                          const SizedBox(height: 10),
                          Text("Stock: ${snapshot.data![index].stock}"),
                        ],
                      ),
                      const SizedBox(width: 10),
                      InkWell(
                        child: const Icon(Icons.update, color: Colors.blue),
                        onTap: () {
                          Navigator.pushNamed(context, "/update", arguments: snapshot.data![index]);
                        },
                      ),
                      const SizedBox(width: 10),
                      InkWell(
                        child: const Icon(Icons.delete, color: Colors.red),
                        onTap: () {
                          ProductService.deleteProduct(snapshot.data![index]);
                        },
                      ),
                    ],
                  ),
                );
              },
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
