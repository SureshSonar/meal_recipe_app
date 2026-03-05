import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_recipe_app/Data/meal_model.dart';
import 'package:meal_recipe_app/provider/favourites_meal_provider.dart';

class mealDetailScreen extends ConsumerWidget {
  final mealModel meal;
  const mealDetailScreen({required this.meal, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<mealModel> favMeals = ref.watch(favourites_Meal_Provider);
    final isfav = favMeals.contains(meal);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          meal.title,
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
            onPressed: () {
              ref.read(favourites_Meal_Provider.notifier).toggleisfav(meal);
            },
            icon: Icon(
              isfav ? Icons.favorite : Icons.favorite_border,
              color: isfav ? Colors.red : Colors.white,
            ),
          ),
        ],
      ),

      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.white),
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(20),
              topLeft: Radius.circular(6),
              bottomRight: Radius.circular(20),
              bottomLeft: Radius.circular(6),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Hero(
                  tag: meal.title,
                  child: Image.asset(
                    meal.imageUrl,
                    width: double.infinity,
                    height: 300,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 6),
                  child: const Text(
                    "Ingredients",
                    style: TextStyle(
                      color: Colors.pinkAccent,
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),

                ...meal.ingredients.map((element) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 2,
                    ),
                    child:  AnimatedTextKit(
                      animatedTexts: [
                        BounceAnimatedText(element,textStyle: TextStyle(color: Colors.white70, fontSize: 18),),
                      ],

                    ),
                  );
                }),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 6),
                  child: const Text(
                    "Steps",
                    style: TextStyle(
                      color: Colors.pinkAccent,
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                ...meal.steps.map((element) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 2,
                    ),
                    child: Text(
                      element,
                      style: TextStyle(color: Colors.white70, fontSize: 18),
                    ),
                  );
                }),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 6),
                  child: const Text(
                    "Other Details",
                    style: TextStyle(
                      color: Colors.pinkAccent,
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 2,
                  ),
                  child: Text(
                    "Duration : ${meal.duration} min",
                    style: TextStyle(color: Colors.white70, fontSize: 18),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 2,
                  ),
                  child: Text(
                    "isGlutenFree : ${meal.isGlutenFree}",
                    style: TextStyle(color: Colors.white70, fontSize: 18),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 2,
                  ),
                  child: Text(
                    "isLactoseFree : ${meal.isLactoseFree}",
                    style: TextStyle(color: Colors.white70, fontSize: 18),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 2,
                  ),
                  child: Text(
                    "isVegan : ${meal.isVegan}",
                    style: TextStyle(color: Colors.white70, fontSize: 18),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 2,
                  ),
                  child: Text(
                    "isVegetarian : ${meal.isVegetarian}",
                    style: TextStyle(color: Colors.white70, fontSize: 18),
                  ),
                ),

                // meal_Info(icon: Icons.fastfood, text: "isLactoseFree : "+meal.isLactoseFree.toString() ),
                // meal_Info(icon: Icons.fastfood, text: "isVegan : "+meal.isVegan.toString() + " min"),
                // meal_Info(icon: Icons.fastfood, text: "isVegetarian : "+meal.isVegetarian.toString() ),

                // final bool isGlutenFree;
                // final bool isVegan;
                // final bool isVegetarian;
                // final bool isLactoseFree;
              ],
            ),
          ),
        ),
      ),
    );
  }
}
