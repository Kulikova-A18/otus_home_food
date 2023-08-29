part of 'package:otus_home_food/testexample.dart';

List<FoodStep> _generate_pancakesSteps(int foodId) {
  List<FoodStep> steps = [];
  steps.add(FoodStep(
    description:
        'Яйца хорошо моем, выбиваем в ёмкость для взбивания, добавляем сахар (30 г или 2 ст. ложки) и соль (1/2 ч. ложки). Перемешиваем до однородности миксером, венчиком или просто вилкой. Здесь у нас нет необходимости взбить яйца в пену, нужно лишь перемешать до однородного состояния и полного растворения соли и сахара.',
    id: 1,
    foodId: foodId,
    // timeSec: 330,
    numberStep: 1,
    isSuccessful: false,
  ));
  steps.add(FoodStep(
    description:
        'Добавляем к яичной массе небольшую часть молока, где-то 100-150 мл. Мы не наливаем всё молоко сразу, потому что, при добавлении муки, более густое тесто проще перемешать до однородного состояния. Если выльем всё молоко сразу, скорее всего, в тесте останутся непромешанные комочки муки, и придётся в дальнейшем процеживать тесто, чтобы от них избавится. Так что пока добавляем только небольшую часть молока и перемешиваем массу до однородности.',
    id: foodId,
    foodId: 2,
    // timeSec: 420,
    numberStep: 2,
    isSuccessful: false,
  ));
  steps.add(FoodStep(
    description:
        'Просеиваем муку (200 г) в ёмкость с тестом. Это необходимо для того, чтобы насытить муку кислородом и очистить её от возможных примесей, поэтому рекомендую не пропускать этот пункт.',
    id: 3,
    foodId: foodId,
    // timeSec: 360,
    numberStep: 3,
    isSuccessful: false,
  ));
  steps.add(FoodStep(
    description:
        'Перемешиваем тесто. Сейчас оно довольно густое, и должно перемешаться до гладкого однородного состояния, без комочков.',
    id: 4,
    foodId: foodId,
    // timeSec: 90,
    numberStep: 4,
    isSuccessful: false,
  ));
  steps.add(FoodStep(
    description:
        'Наливаем остывшее растопленное сливочное или растительное масло в тесто. Перемешиваем до однородности, тесто получится довольно жидкое, примерно как жирные сливки.',
    id: 5,
    foodId: foodId,
    // timeSec: 360,
    numberStep: 5,
    isSuccessful: false,
  ));
  steps.add(FoodStep(
    description:
        'Если тесто получилось очень густое, добавьте немного воды или молока, если же оно жидкое — добавьте немного муки.',
    id: 6,
    foodId: foodId,
    // timeSec: 900,
    numberStep: 6,
    isSuccessful: false,
  ));
  steps.add(FoodStep(
    description: 'Когда тесто готово, пора жарить блины.',
    id: 7,
    foodId: foodId,
    // timeSec: 900,
    numberStep: 7,
    isSuccessful: false,
  ));

  return steps;
}
