import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  // Text Controllers
  TextEditingController searchController = TextEditingController();

  getRecipe(String query) async {
    String url = "https://api.edamam.com/api/recipes/v2?q=$query&type=public&app_id=63bf14e4&app_key=3d0c7b028296776d416ba4b60edd55a4";

    var response = await http.get(Uri.parse(url));
    Map data = jsonDecode(response.body);
    print(data);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // getRecipe("Ladoo");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // background
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xff213A50),
                  Color(0xff071938),
                ]
              )
            ),
          ),
          
          // foreground
          Column(
            children: [

              // Search Bar
              SafeArea(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(24)
                  ),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: (){
                          if ((searchController.text).replaceAll(' ', '').isEmpty){
                            print("Blank Search");
                          } else {
                            getRecipe(searchController.text);
                          }
                        },
                        child: Container(
                          margin: const EdgeInsets.fromLTRB(3, 0, 7, 0),
                          child: const Icon(
                            Icons.search,
                            color: Colors.blueAccent,
                          ),
                        ),
                      ),
                      
                      Expanded(child: TextField(
                        controller: searchController,
                        decoration: const InputDecoration(
                          border: InputBorder.none, hintText: "Let's Cook Something!"
                        ),
                      ))
                    ],
                  ),
                ),
              ),
              // Search bar ----------

              // Heading
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("WHAT DO YOU WANT TO COOK TODAY?", style: TextStyle(fontSize: 33, color: Colors.white),),
                    SizedBox(height: 10),
                    Text("Let's Cook Something New!", style: TextStyle(fontSize: 20, color: Colors.white),)
                  ],
                ),
              )
              // Heading -------------

            ],
          )
        ],
      )
    );
  }
}
