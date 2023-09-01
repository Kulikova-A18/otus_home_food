part of 'package:otus_home_food/screens/home_screen.dart';

List<FoodIngredient> _generate_cookiesIngredients(int foodId) {
  List<FoodIngredient> ingredients = [];
  ingredients.add(FoodIngredient(
      id: 1, foodId: foodId, description: 'сахар', measurement: '1.2 стакан'));
  ingredients.add(FoodIngredient(
      id: 1, foodId: foodId, description: 'мука', measurement: '1 стакан'));
  ingredients.add(FoodIngredient(
      id: 1, foodId: foodId, description: 'шоколад', measurement: '90 г.'));
  ingredients.add(FoodIngredient(
      id: 1, foodId: foodId, description: 'яйцо', measurement: '1 шт.'));
  ingredients.add(FoodIngredient(
      id: 1,
      foodId: foodId,
      description: 'масло сливочное',
      measurement: '80 г'));

  return ingredients;
}
