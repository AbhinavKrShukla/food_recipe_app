import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  // Text Controllers
  TextEditingController searchController = new TextEditingController();

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
                            // Navigator.pushReplacementNamed(context, routeName)
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
              )
              // Search bar ----------



            ],
          )
        ],
      )
    );
  }
}
