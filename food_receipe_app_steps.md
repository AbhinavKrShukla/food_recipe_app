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

### Step 2: Create Search Bar in the Homepage

- Create a Container as the Stack() second element, which works as a Foreground Container. 
- Create Search bar in it. Follow.
  
   ```dart 
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
   ```

#### Step 2.1: Download *Poppins* font from Google fonts and add it as the default font family of the app.

- First download it from **Google fonts**, and add it in pubspec.yaml file. 
- Then, just go to main.dart > MaterialApp() > ThemeData > then add it.

   ```dart
   return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
         fontFamily: "Poppins",     // the default font family
         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
         useMaterial3: true,
      ),
      home: Home(),
      );
   ```

#### Step 2.2: Add the Heading of the Home() page.

- It is the next element of the **Foreground Column()** in the **Stack()**.

```dart
// Heading
Container(
   padding: EdgeInsets.symmetric(horizontal: 20),
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
```


### Step: 3: Getting Data from API.

#### 3.1: Setup API

- Required Dart Packages: http
- URL: "https://api.edamam.com/api/recipes/v2?type=public&app_id=63bf14e4&app_key=3d0c7b028296776d416ba4b60edd55a4&q=biryani";

#### 3.2: Fetch Data from API

- Basic way to fetch data:
  1. Create base url variable.
  2. Create an _async_ method named **getRecipe** (with no return type needed to specify).
     - Params:
       - query <String> : this is search query, entered by the user.
     - This function will hit Api request and get the response.
     - Modify the base url such that it hits with user given search query. Save this url in a new local variable within the function.
     
  3. Hit the get method of http and save it in response<var> variable.
  4. Then, jsonDecode() the response.body and save it in new local variable data<Map>. Then print it (for testing purpose).
  5. Call this method in the **Search bar**, with providing the search text as the user query in the **getRecipe()**.
  
- Example:
  ```dart
  getRecipe(String query) async {
    String url = "https://api.edamam.com/api/recipes/v2?q=$query&type=public&app_id=63bf14e4&app_key=3d0c7b028296776d416ba4b60edd55a4";

    var response = await http.get(Uri.parse(url));
    Map data = jsonDecode(response.body);
    print(data);
  }
  ```






















