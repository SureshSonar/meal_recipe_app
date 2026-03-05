import 'package:flutter_riverpod/legacy.dart';
import 'package:meal_recipe_app/Data/meal_model.dart';

class favouriteMealNotifier extends StateNotifier<List<mealModel>>{
  favouriteMealNotifier(): super([]);

  bool toggleisfav(mealModel meal){

    //checking if ALREADY in the fav list or not
    bool isfav = state.contains(meal);

    if(isfav){
      state = state.where((element) {
        //logic for treversing(iterating through all state) and returning those meals which has not same id as this meal
        return element.id != meal.id;
      }).toList();
      //now that current meal wont be in our fav list so returned false
      return false;
    }
    else{
      //adding this meal into fav and returning true
      state = [...state,meal];
      return true;
    }

  }

}

final favourites_Meal_Provider = StateNotifierProvider<favouriteMealNotifier,List<mealModel>>((ref) {
  return favouriteMealNotifier();
},);