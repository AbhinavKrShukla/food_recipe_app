import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:food_recipe_app/models.dart';
import 'package:food_recipe_app/search.dart';
import 'package:http/http.dart' as http;
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  // Api response variables
  List<RecipeModel> recipeList = <RecipeModel>[];
  bool isLoading = true;

  // Text Controllers
  TextEditingController searchController = TextEditingController();

  getRecipe(String query) async {
    String url = "https://api.edamam.com/api/recipes/v2?q=$query&type=public&app_id=63bf14e4&app_key=3d0c7b028296776d416ba4b60edd55a4";

    var response = await http.get(Uri.parse(url));
    Map data = jsonDecode(response.body);
    // print(data);

    // saving in models
    data['hits'].forEach( (element) {
      RecipeModel recipeModel = RecipeModel();
      recipeModel = RecipeModel.fromMap(element['recipe']);
      recipeList.add(recipeModel);
    });

    // the content is now fully loaded
    setState(() {
      isLoading = false;
    });

    // log(recipeList.toString());

    recipeList.forEach( (recipe) {
      print(recipe.appLabel);
      print(recipe.appCalories);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getRecipe("random");
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
          SingleChildScrollView(
            child:
            isLoading == true ?
            Center(
                child: Container(padding: EdgeInsets.only(top: 50.0),
                    child: CircularProgressIndicator()
                )
            )
                :
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
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) => Search('random'))
                              );
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
                ),
                // Heading -------------
            
                // Displaying Recipe List
                Container(
                  padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: recipeList.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Stack(
                            children: [
                              // Base image
                              Container(
                              width: double.infinity,
                              height: 250,
                              margin: const EdgeInsets.fromLTRB(10, 15, 10, 5),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15.0),
                                color: Colors.white
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(15.0),
                                child: Image.network(
                                  recipeList[index].appImgUrl,
                                  fit: BoxFit.cover,
                                )
                              ),
                              ),

                              // Name and Calories count
                              Container(
                                width: double.infinity,
                                height: 250,
                                margin: const EdgeInsets.fromLTRB(10, 15, 10, 5),
                                padding: const EdgeInsets.only(left: 15, right: 15),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,


                                  children: [
                                    // calories count
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        const Icon(
                                          Icons.local_fire_department,
                                          color: Colors.white,
                                        ),
                                        Text(
                                          recipeList[index].appCalories.toInt().toString(),
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ],
                                    ),

                                    // time Count
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        const Icon(
                                          Icons.timer_outlined,
                                          color: Colors.white,
                                        ),
                                        recipeList[index].totalTime.toInt() == 0 ?
                                          const Text('-', style: TextStyle(color: Colors.white),) :
                                          Text(' ${recipeList[index].totalTime.toInt()} min',
                                          style: const TextStyle(color: Colors.white),
                                        ),
                                      ],
                                    ),
                                    // Spacer(),
                                    Container(
                                      width: double.infinity,
                                      height: 200,
                                      // color: Colors.blueAccent,
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(color: Color(0x44000000)),
                                            child: Text(
                                              recipeList[index].appLabel,
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 15
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],

                                ),
                              )
                          ]
                          ),

                          // Name below the thumbnail
                          // Container(
                          //   child: Text(
                          //     recipeList[index].appLabel,
                          //     style: TextStyle(
                          //       color: Colors.white
                          //     ),
                          //   ),
                          // )
                        ],
                      );
                    },
                  ),
                )
            
              ],
            ),
          )
        ],
      )
    );
  }
}
