# Food Recipe App

- Framework: **Flutter**
- Api: **Edamam** 
  - Url: https://developer.edamam.com/edamam-recipe-api
  

### 1. About the project

- You will get recipe of food.
- Recipe will be fetched from the api.
- You can search recipe in the app.
- Beautiful UI
- Recipe will be showing in webview.
- We can add categories into it as well.

### 2. Design of the app

1. Spalash Screen

2. Home Screen
   - Search Bar
   - What you will make today? [Section]
   - Slide Show of popular recipe.
   - For You [Section] - Personalized receipes (name, thumbnail, along with calories count.)
   - Try Something new [Section] - Categories List (with image)
   - Occasional receipes [Section]
     - Diwali Special
     - Holi Special, etc.


### 3. Project Overview

1. **Frontend**
   - Our app is going to be very simple.
   - We just put the data fetched by api into a list view which will automatically make the different item of data.

2. **Backend** (in the app, not the server)
   - Use of Models
   - Working with lists
   - Working with complicated data


### 4. Major Things to learn

- Model
- ListView
- UI Design


<hr>

# Documentation Starts Here

## *Directory Structure*

- lib
  - main.dart
  - home.dart

## *Codes*

- lib
  - **main.dart**
    ```dart
    import 'package:flutter/material.dart';
    import 'package:food_recipe_app/home.dart';

    void main() {
      runApp(const MyApp());
    }

    class MyApp extends StatelessWidget {
      const MyApp({super.key});

      // This widget is the root of your application.
      @override
      Widget build(BuildContext context) {
         return MaterialApp(
            title: 'Food Recipe App',
            theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
            ),
            home: Home(),
         );
      }
    }
    ```

  
  - **home.dart** - The Home Page

    ```dart
    import 'package:flutter/material.dart';

    class Home extends StatefulWidget {
      const Home({super.key});

      @override
      State<Home> createState() => _HomeState();
    }

    class _HomeState extends State<Home> {
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
              const SafeArea(child: Text('Home Page', style: TextStyle(color: Colors.white),))
            ],
          )
        );
      }
    }
    ``` 