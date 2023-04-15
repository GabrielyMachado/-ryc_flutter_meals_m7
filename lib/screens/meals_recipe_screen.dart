import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';

class MealsRecipeScreen extends StatelessWidget {
  const MealsRecipeScreen({super.key});

  Widget _createSectionTitle(BuildContext context, String title) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Theme.of(context).colorScheme.secondary,
      ),
      child: Text(
        title,
        style: Theme.of(context).textTheme.titleMedium,
      ),
    );
  }

  Widget _createContainerSection(Widget child) {
    return Container(
        height: 250,
        width: double.infinity,
        padding: const EdgeInsets.all(10),
        child: child);
  }

  @override
  Widget build(BuildContext context) {
    final meal = ModalRoute.of(context)?.settings.arguments as Meal;

    return Scaffold(
      appBar: AppBar(title: Text(meal.title)),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 200,
              width: double.infinity,
              child: Image.network(
                meal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            Column(
              children: [
                _createSectionTitle(context, 'Ingredientes'),
                _createContainerSection(
                  ListView.builder(
                    itemCount: meal.ingredients.length,
                    itemBuilder: (ctx, index) {
                      return Card(
                        color: const Color.fromARGB(255, 255, 239, 191),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 5,
                            horizontal: 10,
                          ),
                          child: Text(
                            meal.ingredients[index],
                            style: const TextStyle(fontSize: 16),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                _createSectionTitle(context, 'Modo de preparo'),
                _createContainerSection(
                  ListView.builder(
                    itemCount: meal.steps.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Container(
                            //color: Color.fromARGB(255, 255, 239, 191),
                            padding: const EdgeInsets.symmetric(
                              vertical: 5,
                              horizontal: 10,
                            ),
                            child: ListTile(
                              leading: CircleAvatar(
                                backgroundColor:
                                    Theme.of(context).colorScheme.primary,
                                child: Text('${index + 1}'),
                              ),
                              title: Text(meal.steps[index]),
                            ),
                          ),
                          const Divider(
                            color: Colors.grey,
                            indent: 20,
                            endIndent: 20,
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
