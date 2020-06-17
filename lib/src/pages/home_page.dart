import 'package:flutter/material.dart';
import '../widgets/chicken_category.dart';
import '../widgets/home_top_info.dart';
import '../widgets/search_field.dart';
import '../widgets/bought_foods.dart';

// Model
import '../models/food_model.dart';
// Data
import '../data/food_data.dart';

class HomePage extends StatefulWidget{
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>{
List<Food> _foods = foods;

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.only(top: 40.0, left: 20.0, right: 20.0),
        children: <Widget>[
          HomeTopInfo(),
          ChickenCategory(),
          SizedBox(height: 20.0,),
          SearchField(),
          SizedBox(height: 20.0,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text("Frequently Bought Foods", style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
              GestureDetector(
                onTap: (){},
                child: Text("View All", style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold, color: Theme.of(context).primaryColor))
                ),
            ],
          ),
          SizedBox(height: 20.0,),
          Column(
            children: _foods.map(_buildFoodItems).toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildFoodItems(Food food){
    return Container(
      margin: EdgeInsets.only(bottom: 20.0),
      child: BoughtFoods(
        id: food.id,
        name: food.name,
        imagePath: food.imagePath,
        category: food.category,
        price: food.price,
        discount: food.discount,
        ratings: food.ratings,
      ),
    );
  }
}