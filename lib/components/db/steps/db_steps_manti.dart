part of 'package:otus_home_food/screens/home_screen.dart';

List<FoodStep> _generate_mantiSteps(int foodId) {
  List<FoodStep> steps = [];
  steps.add(FoodStep(
    description:
        'Лук очистить от кожуры, мелко порезать, добавить в фарш, посолить, поперчить. Курдючное сало порезать на мелкие кусочки и смешать с фаршем, посолить, поперчить, хорошо перемешать. Фарш помять.',
    id: 1,
    foodId: foodId,
    // timeSec: 330,
    numberStep: 1,
    isSuccessful: false,
  ));
  steps.add(FoodStep(
    description:
        'Муку просеять с щепоткой соли в глубокую чашку.Сделать углубление, разбить яйцо, налить воды и замесить тесто. Регулируйте количество воды, тесто не должно получится тугим.',
    id: foodId,
    foodId: 2,
    // timeSec: 420,
    numberStep: 2,
    isSuccessful: false,
  ));
  steps.add(FoodStep(
    description:
        'Раскатываем тесто. Лучше тесто разделить на три части, легче будет раскатывать. Тесто нужно раскатывать тонко. Раскатанное тесто разрезать на квадратики, примерно 12-15 см каждая сторона.',
    id: 3,
    foodId: foodId,
    // timeSec: 360,
    numberStep: 3,
    isSuccessful: false,
  ));
  steps.add(FoodStep(
    description: 'В середину выкладываем начинку.',
    id: 4,
    foodId: foodId,
    // timeSec: 90,
    numberStep: 4,
    isSuccessful: false,
  ));
  steps.add(FoodStep(
    description:
        'Соединяем уголки ( для тех кто не знает) нижний левый, правый верхний и наоборот.',
    id: 5,
    foodId: foodId,
    // timeSec: 360,
    numberStep: 5,
    isSuccessful: false,
  ));
  steps.add(FoodStep(
    description:
        'Соединив концы, нужно залепить швы, после этого соединяем левый конец с правым с обеих сторон.',
    id: 6,
    foodId: foodId,
    // timeSec: 900,
    numberStep: 6,
    isSuccessful: false,
  ));
  steps.add(FoodStep(
    description:
        'Решетки смазываем сливочным маслом, выкладываем на них манты. Наливаем в мантышницу воду ( примерно 3 стакана). и готовим на пару с закрытой крышкой примерно 40 минут.',
    id: 7,
    foodId: foodId,
    // timeSec: 240,
    numberStep: 7,
    isSuccessful: false,
  ));

  return steps;
}
