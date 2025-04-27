import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(MyRecipeApp());
}

class MyRecipeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MyRecipe',
      theme: ThemeData(
        primarySwatch: Colors.orange,
        scaffoldBackgroundColor: Colors.orange[50],
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange[50],
      appBar: AppBar(
        title: Text('MyRecipe'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(Icons.restaurant_menu, size: 100, color: Colors.orange[400]),
            SizedBox(height: 20),
            Text(
              'Welcome to MyRecipe!',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.orange[800]),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            Text(
              'Discover delicious recipes and plan your meals easily.',
              style: TextStyle(fontSize: 16, color: Colors.orange[700]),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 40),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                textStyle: TextStyle(fontSize: 18),
              ),
              child: Text('View Recipe Categories'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CategoriesPage()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class CategoriesPage extends StatefulWidget {
  @override
  _CategoriesPageState createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  List categories = [];

  @override
  void initState() {
    super.initState();
    fetchCategories();
  }

  Future<void> fetchCategories() async {
    final response = await http.get(Uri.parse('https://www.themealdb.com/api/json/v1/1/categories.php'));
    if (response.statusCode == 200) {
      setState(() {
        categories = json.decode(response.body)['categories'];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Categories')),
      body: categories.isEmpty
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: categories.length,
              itemBuilder: (context, index) {
                final category = categories[index];
                return ListTile(
                  title: Text(category['strCategory']),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MealsPage(categoryName: category['strCategory']),
                      ),
                    );
                  },
                );
              },
            ),
    );
  }
}

class MealsPage extends StatefulWidget {
  final String categoryName;

  const MealsPage({required this.categoryName});

  @override
  _MealsPageState createState() => _MealsPageState();
}

class _MealsPageState extends State<MealsPage> {
  List meals = [];

  @override
  void initState() {
    super.initState();
    fetchMeals();
  }

  Future<void> fetchMeals() async {
    final response = await http.get(Uri.parse('https://www.themealdb.com/api/json/v1/1/filter.php?c=${widget.categoryName}'));
    if (response.statusCode == 200) {
      setState(() {
        meals = json.decode(response.body)['meals'];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.categoryName)),
      body: meals.isEmpty
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: meals.length >= 5 ? 5 : meals.length,
              itemBuilder: (context, index) {
                final meal = meals[index];
                return MealCard(
                  mealName: meal['strMeal'],
                  mealThumb: meal['strMealThumb'],
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MealDetailPage(mealId: meal['idMeal']),
                      ),
                    );
                  },
                );
              },
            ),
    );
  }
}

class MealDetailPage extends StatefulWidget {
  final String mealId;

  const MealDetailPage({required this.mealId});

  @override
  _MealDetailPageState createState() => _MealDetailPageState();
}

class _MealDetailPageState extends State<MealDetailPage> {
  Map mealDetail = {};

  @override
  void initState() {
    super.initState();
    fetchMealDetail();
  }

  Future<void> fetchMealDetail() async {
    final response = await http.get(Uri.parse('https://www.themealdb.com/api/json/v1/1/lookup.php?i=${widget.mealId}'));
    if (response.statusCode == 200) {
      setState(() {
        mealDetail = json.decode(response.body)['meals'][0];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(mealDetail['strMeal'] ?? 'Loading...')),
      body: mealDetail.isEmpty
          ? Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.network(mealDetail['strMealThumb']),
                  SizedBox(height: 20),
                  Text('Category: ${mealDetail['strCategory']}', style: TextStyle(fontSize: 18)),
                  SizedBox(height: 10),
                  Text('Instructions:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  SizedBox(height: 5),
                  Expanded(child: SingleChildScrollView(child: Text(mealDetail['strInstructions']))),
                ],
              ),
            ),
    );
  }
}

class MealCard extends StatelessWidget {
  final String mealName;
  final String mealThumb;
  final VoidCallback onTap;

  const MealCard({required this.mealName, required this.mealThumb, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: ListTile(
        leading: Image.network(mealThumb, width: 50, height: 50, fit: BoxFit.cover),
        title: Text(mealName),
        onTap: onTap,
      ),
    );
  }
}

