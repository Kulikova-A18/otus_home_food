part of 'package:otus_home_food/testexample.dart';

List<FoodIngredient> _generate_burgerIngredients(int foodId) {
  List<FoodIngredient> ingredients = [];
  ingredients.add(FoodIngredient(
      id: 1,
      foodId: foodId,
      description: 'булочки',
      measurement: 'что покруче'));
  ingredients.add(FoodIngredient(
      id: 1, foodId: foodId, description: 'помидоры', measurement: '1-2 шт.'));
  ingredients.add(FoodIngredient(
      id: 1, foodId: foodId, description: 'лук', measurement: '1-2 шт.'));
  ingredients.add(FoodIngredient(
      id: 1, foodId: foodId, description: 'салат', measurement: ''));
  ingredients.add(FoodIngredient(
      id: 1,
      foodId: foodId,
      description: 'сыр чедер',
      measurement: '1 упаковка'));
  ingredients.add(FoodIngredient(
      id: 1,
      foodId: foodId,
      description: 'маринованые огурчики',
      measurement: '1 банка'));
  ingredients.add(FoodIngredient(
      id: 1, foodId: foodId, description: 'кетчуп', measurement: 'для соуса'));
  ingredients.add(FoodIngredient(
      id: 1, foodId: foodId, description: 'горчица', measurement: 'для соуса'));
  ingredients.add(FoodIngredient(
      id: 1, foodId: foodId, description: 'соль и перец', measurement: '15 г'));
  ingredients.add(FoodIngredient(
      id: 1, foodId: foodId, description: 'сахарная пудра', measurement: ''));
  ingredients.add(FoodIngredient(
      id: 1,
      foodId: foodId,
      description: 'говяжий фарш',
      measurement: '600 г.'));

  return ingredients;
}
