part of 'package:otus_home_food/testexample.dart';

List<FoodIngredient> _generate_pastaBologneseIngredients(int foodId) {
  List<FoodIngredient> ingredients = [];
  ingredients.add(FoodIngredient(
      id: 1, foodId: foodId, description: 'Спагетти', measurement: '250 г'));
  ingredients.add(FoodIngredient(
      id: 1, foodId: foodId, description: 'Фарш мясной', measurement: '250 г'));
  ingredients.add(FoodIngredient(
      id: 1, foodId: foodId, description: 'Морковь', measurement: '0.8 шт'));
  ingredients.add(FoodIngredient(
      id: 1,
      foodId: foodId,
      description: 'Лук репчатый',
      measurement: '0.8 шт'));
  ingredients.add(FoodIngredient(
      id: 1, foodId: foodId, description: 'Помидоры', measurement: '2 шт'));
  ingredients.add(FoodIngredient(
      id: 1,
      foodId: foodId,
      description: 'Томатная паста',
      measurement: '2 ст. л.'));
  ingredients.add(FoodIngredient(
      id: 1,
      foodId: foodId,
      description: 'Растительное масло',
      measurement: '1 ст. л.'));
  ingredients.add(FoodIngredient(
      id: 1, foodId: foodId, description: 'Чеснок', measurement: '1.7 зубч.'));
  ingredients.add(FoodIngredient(
      id: 1, foodId: foodId, description: 'Вода', measurement: '0.8 стакана'));
  ingredients.add(FoodIngredient(
      id: 1, foodId: foodId, description: 'Базилик', measurement: 'по вкусу'));
  ingredients.add(FoodIngredient(
      id: 1, foodId: foodId, description: 'Петрушка', measurement: 'по вкусу'));
  ingredients.add(FoodIngredient(
      id: 1,
      foodId: foodId,
      description: 'Перец черный молотый',
      measurement: 'по вкусу'));
  ingredients.add(FoodIngredient(
      id: 1, foodId: foodId, description: 'соль', measurement: 'по вкусу'));
  return ingredients;
}
