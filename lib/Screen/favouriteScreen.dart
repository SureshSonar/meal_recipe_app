import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_recipe_app/Data/meal_model.dart';
import 'package:meal_recipe_app/Screen/meal_details_screen.dart';
import 'package:meal_recipe_app/Widgets/meal_info.dart';
import 'package:meal_recipe_app/provider/favourites_meal_provider.dart';

class favouriteScreen extends ConsumerWidget {
  
  const favouriteScreen({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final List<mealModel> favMeals = ref.watch(favourites_Meal_Provider);
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            const  Icon(Icons.fastfood),
            Text("Favourite Meals",style: TextStyle(color: Colors.white,fontSize: 24,fontWeight: FontWeight.bold),),
          ],
        ),
      ),
      body: favMeals.isEmpty ? Center(
          child: Text("No favourites meals yet...",style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),)) :
      ListView.builder(itemCount: favMeals.length,itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => mealDetailScreen(meal: favMeals[index]),));
          },
          child: Card(
            clipBehavior: Clip.hardEdge,
            elevation: 2,
            child: Stack(
              children: [
                Image.asset(favMeals[index].imageUrl,fit: BoxFit.cover,
                  height: 300,width: double.infinity,),
                Positioned(
                  bottom: 0,
                  right: 0,
                  left: 0,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 45,vertical: 3),
                    color: Colors.black54,
                    child: Column(
                      children: [
                        Text(favMeals[index].title,style: TextStyle(color: Colors.white,fontSize: 26,fontWeight: FontWeight.bold),),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            //custom widgets for meal info
                            meal_Info(icon: Icons.timer, text: favMeals[index].duration.toString() + " min"),
                            meal_Info(icon: Icons.attach_money, text: favMeals[index].affordability.name.toString()),
                          ],)
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },),
    );
  }
}
