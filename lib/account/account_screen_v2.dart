import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pwa/models/user_model.dart';

class AccountScreenV2 extends StatefulWidget {
  const AccountScreenV2({Key? key}) : super(key: key);

  @override
  State<AccountScreenV2> createState() => _AccountScreenV2State();
}

class _AccountScreenV2State extends State<AccountScreenV2> {
  bool _isLoading = true;
  UserModel? dataFromAPI;

  @override
  void initState() {
    super.initState();
    _getData();
  }

  _getData() async {
    try {
      String url = "https://dummyjson.com/users/1";
      http.Response res = await http.get(Uri.parse(url));
      if (res.statusCode == 200) {
        setState(() {
          dataFromAPI = UserModel.fromJson(json.decode(res.body));
          _isLoading = false;
        });
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return _isLoading
        ? Center(
            child: CircularProgressIndicator(),
          )
        : Container(
            padding: EdgeInsets.only(left: 15, top: 20, right: 15),
            child: ListView(
              children: [
                Center(
                  child: Stack(
                    children: [
                      Container(
                        width: 130,
                        height: 130,
                        decoration: BoxDecoration(
                          border: Border.all(width: 4, color: Colors.white),
                          boxShadow: [
                            BoxShadow(
                              spreadRadius: 2,
                              blurRadius: 10,
                              color: Colors.black.withOpacity(0.1),
                            ),
                          ],
                          shape: BoxShape.circle,
                        ),
                        child: Image.network(
                          dataFromAPI!.image,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Prénom',
                        style: TextStyle(fontSize: 20),
                      ),
                      TextField(
                        controller:
                            TextEditingController(text: dataFromAPI?.firstName),
                        decoration: InputDecoration(
                          hintText: 'John',
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Nom',
                        style: TextStyle(fontSize: 20),
                      ),
                      TextField(
                        controller:
                            TextEditingController(text: dataFromAPI?.lastName),
                        decoration: InputDecoration(
                          hintText: 'Doe',
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Pseudo',
                        style: TextStyle(fontSize: 20),
                      ),
                      TextField(
                        controller:
                            TextEditingController(text: dataFromAPI?.username),
                        decoration: InputDecoration(
                          hintText: 'Jodo',
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Téléphone:',
                        style: TextStyle(fontSize: 20),
                      ),
                      TextField(
                        controller:
                            TextEditingController(text: dataFromAPI?.phone),
                        decoration: InputDecoration(
                          hintText: '+330102030405',
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'email:',
                        style: TextStyle(fontSize: 20),
                      ),
                      TextField(
                        controller:
                            TextEditingController(text: dataFromAPI?.email),
                        decoration: InputDecoration(
                          hintText: 'john.doe@nonymous.com',
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'adresse',
                        style: TextStyle(fontSize: 20),
                      ),
                      TextField(
                        controller: TextEditingController(
                            text: dataFromAPI?.address.address),
                        decoration: InputDecoration(
                          hintText: '42 rue des escargots',
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Code Postal',
                        style: TextStyle(fontSize: 20),
                      ),
                      TextField(
                        controller: TextEditingController(
                            text: dataFromAPI?.address.postalCode),
                        decoration: InputDecoration(
                          hintText: '42420',
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Ville',
                        style: TextStyle(fontSize: 20),
                      ),
                      TextField(
                        controller: TextEditingController(
                            text: dataFromAPI?.address.city),
                        decoration: InputDecoration(
                          hintText: 'Lorette',
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
  }
}
