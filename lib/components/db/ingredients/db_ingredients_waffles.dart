part of 'package:otus_home_food/testexample.dart';

List<FoodIngredient> _generate_wafflesIngredients(int foodId) {
  List<FoodIngredient> ingredients = [];
  ingredients.add(FoodIngredient(
      id: 1, foodId: foodId, description: 'сахар', measurement: '150 г'));
  ingredients.add(FoodIngredient(
      id: 1,
      foodId: foodId,
      description: 'разрыхлитель теста',
      measurement: '2 чайн. л.'));
  ingredients.add(FoodIngredient(
      id: 1, foodId: foodId, description: 'молоко', measurement: '200 мл'));
  ingredients.add(FoodIngredient(
      id: 1, foodId: foodId, description: 'яйцо', measurement: '3 шт.'));
  ingredients.add(FoodIngredient(
      id: 1,
      foodId: foodId,
      description: 'масло сливочное',
      measurement: '180 г'));
  ingredients.add(FoodIngredient(
      id: 1, foodId: foodId, description: 'мука', measurement: '1 ст. ложка'));

  return ingredients;
}
