import 'package:flutter/material.dart';

void main() {
  runApp(const TemperatureConverterMain());
}

class TemperatureConverterMain extends StatelessWidget {
  const TemperatureConverterMain({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TemperatureConverter(),
    );
  }
}

class TemperatureConverter extends StatefulWidget {
  const TemperatureConverter({super.key});

  @override
  State<TemperatureConverter> createState() => _TemperatureConverterState();
}

class _TemperatureConverterState extends State<TemperatureConverter> {
  int groupValue = 0;
  double temperature = 0;
  double result = 0;
  String converted = "";
  final TextEditingController _controller = TextEditingController();
  double sliderValue = 0;

  void performConversion(int value) {
    groupValue = value;
    if (_controller.text.isNotEmpty) {
      temperature = double.parse(_controller.text);
      if (value == 1) {
        result = (temperature - 32) * (5 / 9);
        converted = "$result C";
      } else if (value == 2) {
        result = (temperature * 1.8) + 32;
        converted = "$result F";
      }
      setState(() {});
    }
  }

  void clear() {
    _controller.clear();
    temperature = 0;
    result = 0;
    converted = "";
    groupValue = 0;
    sliderValue = 0;
    setState(() {});
  }

  void updateSlider(double value) {
    sliderValue = value;
    if (groupValue == 1) {
      result = (sliderValue - 32) * (5 / 9);
      converted = "$result C";
    } else if (groupValue == 2) {
      result = (sliderValue * 1.8) + 32;
      converted = "$result F";
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Temperature Converter"),
        backgroundColor: const Color.fromARGB(255, 173, 174, 236),
      ),
      body: Padding(
        padding: EdgeInsets.all(36.0),
        child: Column(
          children: <Widget>[
            SizedBox(height: 10.0),
            TextField(
              controller: _controller,
              decoration: InputDecoration(labelText: "Enter Temperature"),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 10.0),
            Row(
              children: <Widget>[
                Radio(
                  value: 1,
                  groupValue: groupValue,
                  onChanged: (e) => performConversion(e!),
                ),
                Text('F to C'),
                SizedBox(width: 20.0),
                Radio(
                  value: 2,
                  groupValue: groupValue,
                  onChanged: (e) => performConversion(e!),
                ),
                Text('C to F'),
              ],
            ),
            SizedBox(height: 10.0),
            ElevatedButton(
              onPressed: () {
                if (_controller.text.isNotEmpty) {
                  performConversion(groupValue);
                }
              },
              child: Text('Convert'),
            ),
            SizedBox(height: 10.0),
            TextButton(
              onPressed: clear,
              child: Text('Clear'),
            ),
            SizedBox(height: 20.0),
            Text(converted.isEmpty ? '## F or ## C' : converted),
            SizedBox(height: 20.0),
            Slider(
              value: sliderValue,
              min: -100,
              max: 100,
              divisions: 200,
              label: sliderValue.round().toString(),
              onChanged: (value) {
                updateSlider(value);
              },
              activeColor: result < 0
                  ? Colors.blue
                  : result < 20
                      ? Colors.green
                      : result < 50
                          ? Colors.yellow
                          : Colors.red,
            ),
          ],
        ),
      ),
    );
  }
}