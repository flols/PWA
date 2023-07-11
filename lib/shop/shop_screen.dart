import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:pwa/models/data_model.dart';
import 'package:http/http.dart' as http;

class ShopScreen extends StatefulWidget {
  const ShopScreen({Key? key}) : super(key: key);

  @override
  State<ShopScreen> createState() => _ShopScreenState();
}

class _ShopScreenState extends State<ShopScreen> {
  bool _isLoading = true;
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _getData();
  }

  DataModel? dataFromAPI;

  _getData() async {
    try {
      String url = "https://dummyjson.com/products";
      http.Response res = await http.get(Uri.parse(url));
      if (res.statusCode == 200) {
        dataFromAPI = DataModel.fromJson(json.decode(res.body));
        _isLoading = false;
        setState(() {});
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  void addToCart() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('L\'article a été ajouté au panier.'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _isLoading
        ? Center(
            child: CircularProgressIndicator(),
          )
        : Scaffold(
            key: _scaffoldKey,
            body: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 0.60,
              ),
              primary: false,
              itemCount: dataFromAPI!.products.length,
              padding: const EdgeInsets.all(10),
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      AspectRatio(
                        aspectRatio: 1.7,
                        child: Image.network(
                          dataFromAPI!.products[index].thumbnail,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(6),
                        child: Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            dataFromAPI!.products[index].category.toString(),
                            style: TextStyle(
                              fontSize: 16,
                              color: Color(0xFF555555),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(6),
                        child: Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            dataFromAPI!.products[index].title.toString(),
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF555555),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(6),
                        child: Row(
                          children: const [
                            Icon(Icons.star),
                            Icon(Icons.star),
                            Icon(Icons.star),
                            Icon(Icons.star),
                            Icon(Icons.star_outline),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(6),
                        child: Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            dataFromAPI!.products[index].description.toString(),
                            style: TextStyle(
                              fontSize: 16,
                              color: Color(0xFF555555),
                            ),
                          ),
                        ),
                      ),
                      Expanded(child: Container()),
                      Container(
                        padding: EdgeInsets.all(10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "\$${dataFromAPI!.products[index].price.toString()}",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Color(0xFF00A368),
                              ),
                            ),
                            IconButton(
                              icon: const Icon(
                                Icons.add_shopping_cart,
                                color: Colors.black,
                              ),
                              tooltip: 'Add to cart',
                              onPressed: addToCart,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          );
  }
}
