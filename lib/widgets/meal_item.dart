import 'package:flutter/material.dart';

import '../models/meal.dart';

class MealItem extends StatelessWidget {
  final String title;
  final String imageurl;
  final int duration;
  final Complexity complexity;
  final Affordbility affordbility;

  MealItem(
      {@required this.title,
      @required this.imageurl,
      @required this.duration,
      @required this.complexity,
      @required this.affordbility});

  String get complexityText {
    switch (complexity) {
      case Complexity.Simple:
        return 'Simple';
        break;
      case Complexity.Challenging:
        return 'Challenging';
        break;
      case Complexity.Hard:
        return 'Hard';
        break;
      default:
        return 'Unknown';
    }
  }

  String get affordbilityText {
    switch (affordbility) {
      case Affordbility.Affordable:
        return 'Affordable';
        break;
      case Affordbility.Pricey:
        return 'Pricey';
        break;
      case Affordbility.Luxurious:
        return 'Expensive';
        break;
      default:
        return 'Unknown';
    }
  }

  void selectMeal() {}

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: selectMeal,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 4,
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Image.network(
                    imageurl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 20,
                  right: 10,
                  child: Container(
                    width: 300,
                    color: Colors.black54,
                    padding: EdgeInsets.symmetric(
                      vertical: 5,
                      horizontal: 20,
                    ),
                    child: Text(
                      title,
                      style: TextStyle(fontSize: 26, color: Colors.white),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      Icon(Icons.schedule),
                      SizedBox(
                        width: 6,
                      ),
                      Text('$duration min'),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.work),
                      SizedBox(
                        width: 6,
                      ),
                      Text(complexityText),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.currency_rupee),
                      SizedBox(
                        width: 6,
                      ),
                      Text(affordbilityText),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
