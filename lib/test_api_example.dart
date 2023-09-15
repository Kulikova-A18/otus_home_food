import 'package:flutter/material.dart';

import 'package:otus_home_food/components/colors.dart';
import 'package:otus_home_food/components/textStyle.dart';
import 'package:otus_home_food/components/list_assets.dart';

import 'package:otus_home_food/components/recipe/recipe.dart';

var TestApiExampleApiEnumID = '';
var TestApiExampleApiEnumNAME = '';
var TestApiExampleApiEnumPHOTO = '';
var TestApiExampleApiEnumINSTRUCTIONS = '';

void main() => runApp(TestApiExample());

class TestApiExample extends StatefulWidget {
  const TestApiExample({Key? key}) : super(key: key);

  @override
  _TestApiExampleState createState() => _TestApiExampleState();
}

class _TestApiExampleState extends State<TestApiExample> {
  @override
  void initState() {
    getRecipes();

    TestApiExampleApiEnumID = apiEnumID;
    TestApiExampleApiEnumNAME = apiEnumNAME;
    TestApiExampleApiEnumPHOTO = apiEnumPHOTO;
    TestApiExampleApiEnumINSTRUCTIONS = apiEnumINSTRUCTIONS;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
