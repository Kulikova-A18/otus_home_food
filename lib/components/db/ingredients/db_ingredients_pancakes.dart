part of 'package:otus_home_food/testexample.dart';

List<FoodIngredient> _generate_pancakesIngredients(int foodId) {
  List<FoodIngredient> ingredients = [];
  ingredients.add(FoodIngredient(
      id: 1,
      foodId: foodId,
      description: 'сахар',
      measurement: '30 г (2 ст. ложки)'));
  ingredients.add(FoodIngredient(
      id: 1, foodId: foodId, description: 'молоко', measurement: '500 мл'));
  ingredients.add(FoodIngredient(
      id: 1,
      foodId: foodId,
      description: 'соль',
      measurement: '2-3 г (1/2 ч. ложки)'));
  ingredients.add(FoodIngredient(
      id: 1, foodId: foodId, description: 'яйцо', measurement: '3 шт.'));
  ingredients.add(FoodIngredient(
      id: 1,
      foodId: foodId,
      description: 'масло сливочное',
      measurement: '30 г (2 ст. ложки)'));
  ingredients.add(FoodIngredient(
      id: 1, foodId: foodId, description: 'мука', measurement: '200 г'));

  return ingredients;
}
