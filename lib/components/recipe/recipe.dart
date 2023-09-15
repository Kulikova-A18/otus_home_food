import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'dart:io';
import 'package:dio/dio.dart';

import 'package:otus_home_food/components/hive/hive_types.dart';
import 'package:otus_home_food/components/base_module/base_module.dart';

part 'recipe.g.dart';
part 'recipe_pub_data.dart';

// ============ dio =================
final Dio dio = Dio(new BaseOptions(
  baseUrl: "https://www.themealdb.com",
));

final nameJsonFoodMenu = '/api/json/v1/1/search.php?s=Arrabiata';

// example : https://www.themealdb.com/meal/52771
/*
id (idMeal): 52771

name (strMeal): Spicy Arrabiata Penne

photo (strMealThumb): https://www.themealdb.com/images/media/meals/ustsqw1468250014.jpg

ingredient[N] (strIngredient[N]): ...

instructions (strInstructions):
Bring a large pot of water to a boil. Add kosher salt to the boiling water, then add the pasta. Cook according to the package instructions, about 9 minutes.
In a large skillet over medium-high heat, add the olive oil and heat until the oil starts to shimmer. Add the garlic and cook, stirring, until fragrant, 1 to 2 minutes. Add the chopped tomatoes, red chile flakes, Italian seasoning and salt and pepper to taste. Bring to a boil and cook for 5 minutes. Remove from the heat and add the chopped basil.
Drain the pasta and add it to the sauce. Garnish with Parmigiano-Reggiano flakes and more basil and serve warm.
*/
class Recipe {
  String? id;
  String? name;
  String? photo;
  String? instructions;

  Recipe(this.id, this.name, this.photo, this.instructions);

  /// Convert from JSON response stream to Recipe object
  Recipe.fromJson(Map<String, dynamic> json) {
    id = json['idMeal'].toString();
    name = json['strMeal'];
    photo = json['strMealThumb'];
    instructions = json['strInstructions'];

    printtoJson();
    createHive();
    // from gui
    appropriationPubElements();
  }

  /// Convert an in-memory representation of a Recipe object to a Map<String, dynamic>
  Map<String, dynamic> toJson() => {
        'idMeal': id,
        'strMeal': name,
        'strMealThumb': photo,
        'strInstructions': instructions,
      };

  void printtoJson() {
    print('============printtoJson===========');
    print('id: ${this.id}');
    print('name: ${this.name}');
    print('photo: ${this.photo}');
    print('instructions: ${this.instructions}');
  }

  void createHive() async {
    var path = Directory.current.path;

    // try {
    //   // delete file
    //   var file = File('$path/testbox.hive');
    //   if (await file.exists()) {
    //     await file.delete();
    //     print(
    //         "\n ============ file.delete =========== \n ${file.path} deleted");
    //   }
    // } catch (e) {}

    // write hive
    Hive
      ..init(path)
      ..registerAdapter(PersonAdapter());

    var box = await Hive.openBox('testBox');

    var person = Person(
      id: '${this.id}',
      name: '${this.name}',
      photo: '${this.photo}',
      instructions: '${this.instructions}',
    );

    await box.put('${this.id}', person);
    print(box.get('${this.id}'));
  }

  void appropriationPubElements() {
    apiEnumID = '${this.id}';
    apiEnumNAME = '${this.name}';
    apiEnumPHOTO = '${this.photo}';
    apiEnumINSTRUCTIONS = '${this.instructions}';
  }
}

Future getRecipes() async {
  var response = await dio.get(nameJsonFoodMenu);
  if (response.statusCode != null) {
    if (response.statusCode! >= 400) {
      return List.empty();
    } else {
      var json = response.data['meals'][0];

      try {
        print('============json===========');
        print(json);

        print('${json.runtimeType} : $json');
        Recipe.fromJson(json);
      } catch (e) {
        print("error");
      }
    }
  }
  return List.empty();
}
