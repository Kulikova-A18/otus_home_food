part of 'package:otus_home_food/testexample.dart';

List<FoodIngredient> _generate_mantiIngredients(int foodId) {
  List<FoodIngredient> ingredients = [];
  ingredients.add(FoodIngredient(
      id: 1, foodId: foodId, description: 'мука', measurement: '1,3 кг'));
  ingredients.add(FoodIngredient(
      id: 1,
      foodId: foodId,
      description: 'фарш бараний',
      measurement: '1 ½ г'));
  ingredients.add(FoodIngredient(
      id: 1, foodId: foodId, description: 'вода', measurement: '220 г.'));
  ingredients.add(FoodIngredient(
      id: 1,
      foodId: foodId,
      description: 'лук репчатый',
      measurement: '5 шт.'));
  ingredients.add(FoodIngredient(
      id: 1,
      foodId: foodId,
      description: 'курдючное сало',
      measurement: '100 г'));
  ingredients.add(FoodIngredient(
      id: 1, foodId: foodId, description: 'яйцо', measurement: '1 шт.'));
  ingredients.add(FoodIngredient(
      id: 1,
      foodId: foodId,
      description: 'масло сливочное',
      measurement: '50 г'));
  ingredients.add(FoodIngredient(
      id: 1,
      foodId: foodId,
      description: 'соль и перец',
      measurement: 'по вкусу'));
  return ingredients;
}
