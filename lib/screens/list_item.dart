// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:techspace/models/item.dart';
import 'package:techspace/screens/detail_item.dart';
import 'package:techspace/widgets/left_drawer.dart';

class ItemPage extends StatefulWidget {
  const ItemPage({Key? key}) : super(key: key);

  @override
  _ItemPageState createState() => _ItemPageState();
}

class _ItemPageState extends State<ItemPage> {
  Future<List<Item>> fetchItem() async {
    // TODO: Ganti URL!
    var url = Uri.parse('https://kristoforus-adi-tugas.pbp.cs.ui.ac.id/json/');
    // var url = Uri.parse('http://localhost:8000/json/');
    var response = await http.get(
      url,
      headers: {"Content-Type": "application/json"},
    );

    // Melakukan decode response menjadi bentuk JSON.
    var data = jsonDecode(utf8.decode(response.bodyBytes));

    // Melakukan konversi data JSON menjadi object Item.
    List<Item> listItem = [];
    for (var d in data) {
      if (d != null) {
        listItem.add(Item.fromJson(d));
      }
    }
    return listItem;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Center(
            child: Text(
              'Daftar Item',
            ),
          ),
          backgroundColor: const Color.fromRGBO(33, 33, 33, 1),
          foregroundColor: Colors.white,
        ),
        drawer: const LeftDrawer(),
        body: FutureBuilder(
            future: fetchItem(),
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.data == null) {
                return const Center(child: CircularProgressIndicator());
              } else {
                if (!snapshot.hasData) {
                  return const Column(
                    children: [
                      Text(
                        "Tidak ada data item.",
                        style:
                            TextStyle(color: Color(0xff59A5D8), fontSize: 20),
                      ),
                      SizedBox(height: 8),
                    ],
                  );
                }
                return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (_, index) => InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ItemDetailPage(
                                    name: snapshot.data![index].fields.name,
                                    amount: snapshot.data![index].fields.amount
                                        .toString(),
                                    description: snapshot
                                        .data![index].fields.description,
                                    price: snapshot.data![index].fields.price
                                        .toString(),
                                  )));
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 12),
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${snapshot.data![index].fields.name}",
                            style: const TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                              "Amount: ${snapshot.data![index].fields.amount}"),
                          const SizedBox(height: 10),
                          Text(
                              "Description: ${snapshot.data![index].fields.description}"),
                          const SizedBox(height: 10),
                        ],
                      ),
                    ),
                  ),
                );
              }
            }));
  }
}
