import 'package:flutter/material.dart';
import 'package:mike_test/animated_logo.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<String> foods = ["Apple", "Orange", "China"];
    return Scaffold(
      appBar: AppBar(
        title: Text('MikeApp'),
        actions: <Widget>[
          IconButton(
            onPressed: null,
            icon: Icon(Icons.add_a_photo),
          ),
          IconButton(
            icon: Icon(Icons.access_alarm),
            onPressed: () {
              print('Alarm');
            },
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          Stack(children: [
            Text('Hello',
                style: Theme.of(context)
                    .textTheme
                    .display4
                    .copyWith(color: Colors.red)),
            Positioned(
              top: 10,
              left: 100,
              child: Text('YO'),
            )
          ]),
          Expanded(
            child: ListView.builder(
              itemCount: foods.length,
              itemBuilder: (BuildContext context, int index) {
                String food = foods[index];
                return ListTile(
                  leading:
                      Icon(food == "China" ? Icons.restaurant : Icons.people),
                  title: Text(food),
                  subtitle: Text(food.toLowerCase()),
                  onTap: () {
                    Scaffold.of(context).showSnackBar(SnackBar(
                      content: Text("Eating $food"),
                      backgroundColor: food == "China" ? Colors.green : Colors.red,
                    ));
                  },
                );
              },
            ),
          ),
          AnimatedLogo(size: 100),
          AnimatedLogo(size: 100),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print('HHHHHH');
        },
        child: Text('H'),
      ),
    );
  }
}
