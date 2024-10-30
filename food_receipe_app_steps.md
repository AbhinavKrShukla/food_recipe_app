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

## Steps to follow

### Step 1: Create Homepage and its Background

1. Create **home.dart** in **lib**.
2. Update the main to open **Home()** class when app starts.

3. Create Backgoround for Home() Screen.

   - Create a **Scaffold()** widget, whose **body** will be a **Stack()**.
   - Then, create the Stack() widget, whose first element is going to be the background.
   ```dart
   Stack(
      children: [
         // background
         Container(
         width: MediaQuery.of(context).size.width,
         height: MediaQuery.of(context).size.height,
         decoration: BoxDecoration(
            gradient: LinearGradient(
               colors: [
               Color(0xff213A50),
               Color(0xff071938),
               ]
            )
         ),
         ),
         
         // foreground
         SafeArea(child: Text('Home Page', style: TextStyle(color: Colors.white),))
      ],
   )
   ```