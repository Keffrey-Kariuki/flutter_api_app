import 'dart:convert';

import "package:flutter/material.dart";
import 'package:http/http.dart' as http;

class MealDBPage extends StatefulWidget {
  const MealDBPage({Key? key}) : super(key: key);

  @override
  State<MealDBPage> createState() => _MealDBPageState();
}

class _MealDBPageState extends State<MealDBPage> {

  List<Soup> soupData = [];
  late Future<List<Soup>> futureSoups;

  @override
  void initState() {
    super.initState();
    futureSoups = getSoups();
    futureSoups.then((soups) => {
      setState((){
        soupData = soups;
      })
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView.builder(
        itemCount: soupData.length,
        itemBuilder: (BuildContext context, int index){
          var soup = soupData[index];
          return ListTile(
            leading: Image.network(soup.image),
            title: Text(soup.name),
            subtitle: Text(soup.country),
            onTap: (){
              showDialog(context: context, builder: (BuildContext context){
                return AlertDialog(
                  title: Text(soup.name),
                  content: Text(soup.instructions),
                );
              });
            },
          );
        },
      )
    );
  }
}

Future<List<Soup>> getSoups() async {
  var url = Uri.parse("https://www.themealdb.com/api/json/v1/1/search.php?s=soup");
  var response = await http.get(url);
  if(response.statusCode == 200){
    var body = response.body;
    var json = jsonDecode(body);
    var meals = json['meals'] as List;
    List<Soup> soups = meals.map((meal) => Soup.fromJson(meal)).toList();
    return soups;
  }else{
    throw Exception("Could not retrieve soups");
  }

}


class Soup {
  final String id;
  final String name;
  final String country;
  final String instructions;
  final String image;

  Soup({
    required this.id,
    required this.name,
    required this.country,
    required this.instructions,
    required this.image
  });

  factory Soup.fromJson(Map<String, dynamic> json){
    return Soup(
        id: json['idMeal'],
        name: json['strMeal'],
        country: json['strArea'],
        instructions: json['strInstructions'],
        image: json['strMealThumb']);
  }


}
