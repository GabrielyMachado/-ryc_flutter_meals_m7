import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';

class MealsRecipeScreen extends StatelessWidget {
  const MealsRecipeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final meal = ModalRoute.of(context)?.settings.arguments as Meal;

    return Scaffold(
      appBar: AppBar(title: Text(meal.title)),
      body: Text('Detalhes da receita'),
    );
  }
}
