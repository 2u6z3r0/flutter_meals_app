import 'package:flutter/material.dart';
import '../dummy_data.dart';
import '../models/meal.dart';

class MealDetailsScreen extends StatelessWidget {
  static const routeName = '/meal-details';

  Widget titleContainer(BuildContext ctx, String title) {
    return Container(
        padding: EdgeInsets.all(10),
        child: Text(title, style: Theme.of(ctx).textTheme.title));
  }

  Widget listContainer({@required Widget child}) {
    return Container(
      padding: EdgeInsets.all(10),
      height: 200,
      width: 300,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(20),
      ),
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final String id = routeArgs['id'];
    final Meal mealData = DUMMY_MEALS.firstWhere((meal) => meal.id == id);

    return Scaffold(
      appBar: AppBar(
        title: Text('${mealData.title}'),
      ),
      backgroundColor: Colors.amber[50],
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(mealData.imageUrl, fit: BoxFit.cover),
            ),
            titleContainer(context, 'Ingredients'),
            listContainer(
              child: ListView.builder(
                itemBuilder: (ctx, index) {
                  return Card(
                    // margin: EdgeInsets.symmetric(vertical: 5, horizontal: ),
                    color: Theme.of(context).accentColor,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 10),
                      child: Text(mealData.ingredients[index]),
                    ),
                  );
                },
                itemCount: mealData.ingredients.length,
              ),
            ),
            titleContainer(context, 'Steps'),
            listContainer(
              child: ListView.builder(
                itemBuilder: (ctx, index) {
                  return Column(
                    children: <Widget>[
                      ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Theme.of(context).primaryColor,
                          child: Text(
                            '# ${index + 1}',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        title: Text(mealData.steps[index]),
                      ),
                      Divider(),
                    ],
                  );
                },
                itemCount: mealData.steps.length,
              ),
            ),
            SizedBox(
              height: 10,
            )
          ],
        ),
      ),
    );
  }
}
