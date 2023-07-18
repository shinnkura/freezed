import 'package:flutter/material.dart';
import 'package:freezed_example/No_Freeezed-and-riverpod/abc_list.dart';
import 'package:freezed_example/No_Freeezed-and-riverpod/fish.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Fish fish;
  late AbcList abcList;

  @override
  void initState() {
    super.initState();
    fish = Fish(
      name: 'マグロ',
      size: 200,
      price: 300,
    );
    abcList = AbcList([
      'A',
      'B',
      'C',
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text('名前: ${fish.name}'),
            Text('大きさ: ${fish.size} cm'),
            Text('値段: ${fish.price} 万円'),
            Text('ABCリスト: ${abcList.values.join(', ')}'),
            ElevatedButton(
              onPressed: updateFishAndAbcList,
              child: const Text('変更する'),
            ),
          ],
        ),
      ),
    );
  }

  void updateFishAndAbcList() {
    setState(() {
      fish = fish.copyWith(price: 500);
      abcList = abcList.copyWith(values: abcList.values + ['D']);
    });
  }
}
