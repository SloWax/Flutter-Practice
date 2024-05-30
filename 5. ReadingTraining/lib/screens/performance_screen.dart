import 'package:flutter/material.dart';
import 'package:sharedpreferences/data/performance.dart';
import 'package:sharedpreferences/data/sp_helper.dart';

class PerformanceScreen extends StatefulWidget {
  const PerformanceScreen({super.key});

  @override
  State<PerformanceScreen> createState() => _PerformanceScreenState();
}

class _PerformanceScreenState extends State<PerformanceScreen> {
  final TextEditingController txtDescription = TextEditingController();
  final TextEditingController txtDuration = TextEditingController();
  final SPHelper helper = SPHelper();
  List<Performance> performances = [];

  @override
  void initState() {
    helper.init().then((value) {
      updateScreen();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('독서 트레이닝')),
      body: ListView(
        children: getContent(),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          showPerformanceDialog(context);
        },
      ),
    );
  }

  Future<dynamic> showPerformanceDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('독서 기록'),
            content: SingleChildScrollView(
                child: Column(
              children: [
                TextField(
                  controller: txtDescription,
                  decoration: const InputDecoration(hintText: '책 제목/설명'),
                ),
                TextField(
                  controller: txtDuration,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(hintText: '독서량(분)'),
                ),
              ],
            )),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  txtDescription.text = '';
                  txtDuration.text = '';
                },
                child: const Text('Cancel'),
              ),
              ElevatedButton(
                onPressed: savePerformance,
                child: const Text('Save'),
              )
            ],
          );
        });
  }

  void savePerformance() async {
    int id = helper.getCounter() + 1;
    DateTime now = DateTime.now();
    String today = '${now.year}-${now.month}-${now.day}';

    Performance newPerformance = Performance(
        id, today, txtDescription.text, int.tryParse(txtDuration.text) ?? 0);

    helper.writePerformance(newPerformance).then((_) {
      updateScreen();
      helper.setCounter(id);
    });

    txtDescription.text = '';
    txtDuration.text = '';

    Navigator.pop(context);
  }

  List<Widget> getContent() {
    List<Widget> titles = [];
    for (var performance in performances) {
      titles.add(Dismissible(
          key: UniqueKey(),
          onDismissed: (_) {
            helper
                .deletePerformance(performance.id)
                .then((value) => updateScreen());
          },
          child: ListTile(
              title: Text(performance.description),
              subtitle: Text(
                  '${performance.date} - 시간: ${performance.duration} 분'))));
    }
    return titles;
  }

  void updateScreen() {
    performances = helper.getPerformances();
    setState(() {});
  }
}
