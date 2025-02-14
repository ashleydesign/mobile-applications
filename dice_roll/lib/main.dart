import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const DiceRollMain());
}

// MaterialApp widget
class DiceRollMain extends StatelessWidget {
  const DiceRollMain({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: DiceRoll(),
    );
  }
}
// End MaterialApp

class DiceRoll extends StatefulWidget {
  const DiceRoll({super.key});

  @override
  State<DiceRoll> createState() => _DicerollState();
}

class _DicerollState extends State<DiceRoll> {
  int diceNumber1 = 1;
  int diceNumber2 = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dice Roll"),
        backgroundColor: const Color.fromARGB(255, 95, 199, 185),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("images/dice-$diceNumber1.png"),
              const SizedBox(height: 20), // Add some space between the dice
              Image.asset("images/dice-$diceNumber2.png"),
              const SizedBox(height: 20), // Add some space between the dice and the total
              Text(
                "Total: ${diceNumber1 + diceNumber2}",
                style: const TextStyle(fontSize: 24),
              ),
              const SizedBox(height: 20), // Add some space between the total and the button
              ElevatedButton(
                onPressed: () => setState(() {
                  //Random.NextInt(n) returns a random value between 0 and n-1
                  diceNumber1 = Random().nextInt(6) + 1;
                  diceNumber2 = Random().nextInt(6) + 1;
                  print("Dice 1: $diceNumber1, Dice 2: $diceNumber2");
                }),
                child: const Text("Roll Dice"),
              ),
              const SizedBox(height: 100), // Add some extra space at the bottom
            ],
          ),
        ),
      ),
    );
  }
}

