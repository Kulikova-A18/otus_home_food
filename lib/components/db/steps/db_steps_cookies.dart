part of 'package:otus_home_food/testexample.dart';

List<FoodStep> _generate_cookiesSteps(int foodId) {
  List<FoodStep> steps = [];
  steps.add(FoodStep(
    description:
        'Добавить в емкость теплое сливочное масло и сахар, хорошо перемешать. Добавить яйцо, взбить до однородного состояния. Приступить к муке, добавить постепенно, просеять через сито. Отправить в холодильник.',
    id: 1,
    foodId: foodId,
    // timeSec: 330,
    numberStep: 1,
    isSuccessful: false,
  ));
  steps.add(FoodStep(
    description: 'Нарезать шоколад маленькими кубиками.',
    id: foodId,
    foodId: 2,
    // timeSec: 420,
    numberStep: 2,
    isSuccessful: false,
  ));
  steps.add(FoodStep(
    description: 'Противень застелить бумагой для выпечки.',
    id: 3,
    foodId: foodId,
    // timeSec: 360,
    numberStep: 3,
    isSuccessful: false,
  ));
  steps.add(FoodStep(
    description: 'Достать тесто из холодильника и смешать его с шоколадом.',
    id: 4,
    foodId: foodId,
    // timeSec: 90,
    numberStep: 4,
    isSuccessful: false,
  ));
  steps.add(FoodStep(
    description:
        'Сформировать из теста шарик и украсить его сверху кусочками шоколада. Выложить будущее печенье на противень (оставить расстояние между печеньем, они будут растекаться).',
    id: 5,
    foodId: foodId,
    // timeSec: 360,
    numberStep: 5,
    isSuccessful: false,
  ));
  steps.add(FoodStep(
    description:
        'Поставить в духовку, разогретую до 180 градусов, на 10–15 минут.',
    id: 6,
    foodId: foodId,
    // timeSec: 900,
    numberStep: 6,
    isSuccessful: false,
  ));

  return steps;
}
