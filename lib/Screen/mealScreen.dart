import 'package:flutter/material.dart';
import 'package:meal_recipe_app/Data/meal_data.dart';
import 'package:meal_recipe_app/Data/meal_model.dart';
import 'package:meal_recipe_app/Screen/meal_details_screen.dart';
import 'package:meal_recipe_app/Widgets/meal_info.dart';

class mealScreen extends StatelessWidget {
  final String catId;
  final String title; //actually its title of category
  const mealScreen({required this.catId, required this.title, super.key});
  @override
  Widget build(BuildContext context) {
    List<mealModel> filteredmeals = listofMeals.where((meal) {
      return meal.category.contains(title);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            const Icon(Icons.fastfood),
            Text(
              title,
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
      body: ListView.builder(
        itemCount: filteredmeals.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      mealDetailScreen(meal: filteredmeals[index]),
                ),
              );
            },
            child: Card(
              clipBehavior: Clip.hardEdge,
              elevation: 2,
              child: Stack(
                children: [
                  Hero(
                    tag: filteredmeals[index].title,
                    child:Image.asset(
                    filteredmeals[index].imageUrl,
                    fit: BoxFit.cover,
                    height: 300,
                    width: double.infinity,
                  ),),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    left: 0,
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 45,
                        vertical: 3,
                      ),
                      color: Colors.black54,
                      child: Column(
                        children: [
                          Text(
                            filteredmeals[index].title,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 26,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              //custom widgets for meal info
                              meal_Info(
                                icon: Icons.timer,
                                text: "${filteredmeals[index].duration} min",
                              ),
                              meal_Info(
                                icon: Icons.attach_money,
                                text: filteredmeals[index].affordability.name
                                    .toString(),
                              ),
                              meal_Info(
                                icon: Icons.baby_changing_station,
                                text: filteredmeals[index].complexity.name
                                    .toString(),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
