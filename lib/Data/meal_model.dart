enum Complexity{
  simple,
  challenging,
  hard
}
enum Affordability{
  affordable,
  pricey,
  luxurious
}


class mealModel{
  final String id;
  final String title;
  final List<String> category;
  final String imageUrl;
  final List<String> ingredients;
  final List<String> steps;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;
  final bool isGlutenFree;
  final bool isVegan;
  final bool isVegetarian;
  final bool isLactoseFree;

  mealModel(this.id, this.title, this.category, this.imageUrl, this.ingredients, this.steps, this.duration, this.complexity, this.affordability, this.isGlutenFree, this.isVegan, this.isVegetarian, this.isLactoseFree);

}