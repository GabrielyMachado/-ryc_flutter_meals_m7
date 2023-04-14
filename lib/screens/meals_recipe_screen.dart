import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';

class MealsRecipeScreen extends StatelessWidget {
  const MealsRecipeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final meal = ModalRoute.of(context)?.settings.arguments as Meal;

    return Scaffold(
        appBar: AppBar(title: Text(meal.title)),
        body: Column(
          children: [
            Container(
              height: 200,
              width: double.infinity,
              child: Image.network(
                meal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            SingleChildScrollView(
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.all(8),
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Theme.of(context).colorScheme.secondary,
                ),
                child: Text(
                  'Ingredientes',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
            ),
            Container(
              height: 250,
              width: double.infinity,
              padding: EdgeInsets.all(10),
              child: ListView.builder(
                itemCount: meal.ingredients.length,
                itemBuilder: (ctx, index) {
                  return Card(
                    color: Color.fromARGB(255, 255, 239, 191),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 10),
                      child: Text(
                        meal.ingredients[index],
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ));
  }
}
