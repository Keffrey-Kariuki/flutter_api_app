import "package:flutter/material.dart";

class MealDBPage extends StatefulWidget {
  const MealDBPage({Key? key}) : super(key: key);

  @override
  State<MealDBPage> createState() => _MealDBPageState();
}

class _MealDBPageState extends State<MealDBPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(
                Icons.fastfood_outlined
            ),
          ]
      ),
    );
  }

}
