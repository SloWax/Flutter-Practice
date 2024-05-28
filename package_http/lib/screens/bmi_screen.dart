import 'package:flutter/material.dart';

class BmiScreen extends StatefulWidget {
  const BmiScreen({super.key});

  @override
  State<BmiScreen> createState() => _BmiScreenState();
}

class _BmiScreenState extends State<BmiScreen> {
  bool isMetric = true;
  bool isImperial = false;
  late List<bool> isSelected;

  final TextEditingController textHeight = TextEditingController();
  final TextEditingController textWeight = TextEditingController();

  String result = '';

  @override
  void initState() {
    isSelected = [isMetric, isImperial];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('체질량 계산기'),
        backgroundColor: Colors.indigo,
      ),
      body: Column(
        children: [
          ToggleButtons(
            isSelected: isSelected,
            onPressed: toggleSelect,
            children: const [
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Text('미터법', style: TextStyle(fontSize: 18))),
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Text('파운드법', style: TextStyle(fontSize: 18))),
            ],
          ),
          Padding(
              padding: const EdgeInsets.all(24),
              child: TextField(
                controller: textHeight,
                keyboardType: TextInputType.number,
                decoration:
                    InputDecoration(hintText: (isMetric) ? 'cm' : 'inch'),
              )),
          Padding(
            padding: const EdgeInsets.all(24),
            child: TextField(
                controller: textWeight,
                keyboardType: TextInputType.number,
                decoration:
                    InputDecoration(hintText: (isImperial) ? 'pound' : 'kg')),
          ),
          ElevatedButton(
              onPressed: calcuBmi,
              child: const Text('체질량 계산', style: TextStyle(fontSize: 18))),
          Text(result, style: const TextStyle(fontSize: 18))
        ],
      ),
    );
  }

  void toggleSelect(value) {
    bool isValue = (value == 0);

    isMetric = isValue;
    isImperial = !isValue;

    setState(() {
      textHeight.text = '';
      textWeight.text = '';
      result = '';

      isSelected = [isMetric, isImperial];
    });
  }

  void calcuBmi() {
    double bmi = 0;
    double height = double.tryParse(textHeight.text) ?? 0;
    double weight = double.tryParse(textWeight.text) ?? 0;

    if (isMetric) {
      bmi = weight / (height / 100 * height / 100);
    } else {
      bmi = weight * 703 / (height * height);
    }

    setState(() {
      result = '체질량 지수: ${bmi.toStringAsFixed(2)}';
    });
  }
}
