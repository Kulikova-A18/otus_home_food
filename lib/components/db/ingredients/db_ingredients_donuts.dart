part of 'package:otus_home_food/testexample.dart';

List<FoodIngredient> _generate_donutsIngredients(int foodId) {
  List<FoodIngredient> ingredients = [];
  ingredients.add(FoodIngredient(
      id: 1, foodId: foodId, description: 'сахар', measurement: '50 г'));
  ingredients.add(FoodIngredient(
      id: 1,
      foodId: foodId,
      description: 'дрожжи сухие',
      measurement: '7 щепоток'));
  ingredients.add(FoodIngredient(
      id: 1, foodId: foodId, description: 'вода', measurement: '50 мл'));
  ingredients.add(FoodIngredient(
      id: 1, foodId: foodId, description: 'молоко', measurement: '70 мл'));
  ingredients.add(FoodIngredient(
      id: 1, foodId: foodId, description: 'соль', measurement: '5 щепоток'));
  ingredients.add(FoodIngredient(
      id: 1, foodId: foodId, description: 'яйцо', measurement: '1 шт.'));
  ingredients.add(FoodIngredient(
      id: 1,
      foodId: foodId,
      description: 'Лимонный сок',
      measurement: '250 г'));
  ingredients.add(FoodIngredient(
      id: 1, foodId: foodId, description: 'мука', measurement: '1 ст. ложка'));
  ingredients.add(FoodIngredient(
      id: 1,
      foodId: foodId,
      description: 'масло сливочное',
      measurement: '15 г'));
  ingredients.add(FoodIngredient(
      id: 1,
      foodId: foodId,
      description: 'сахарная пудра',
      measurement: '50 г'));
  ingredients.add(FoodIngredient(
      id: 1, foodId: foodId, description: 'глазурь', measurement: 'по вкусу'));
  ingredients.add(FoodIngredient(
      id: 1,
      foodId: foodId,
      description: 'посыпка кондитерская',
      measurement: 'по вкусу'));
  return ingredients;
}
