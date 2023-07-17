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
  Fish fish = Fish(
    name: 'マグロ',
    size: 200,
    price: 300,
  );

  AbcList abcList = AbcList([
    'A',
    'B',
    'C',
  ]);

  @override
  Widget build(BuildContext context) {
    final nameText = Text('名前: ${fish.name}');
    final sizeText = Text('大きさ: ${fish.size} cm');
    final priceText = Text('値段: ${fish.price} 万円');
    final abcListText = Text('ABCリスト: ${abcList.values.join(', ')}');

    final button = ElevatedButton(
      onPressed: onPressed,
      child: const Text('変更する'),
    );

    final column = Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        nameText,
        sizeText,
        priceText,
        abcListText,
        button,
      ],
    );

    return Scaffold(
      body: Center(
        child: column,
      ),
    );
  }

  void onPressed() {
    setState(() {
      fish = fish.copyWith(price: 500);
      abcList = abcList.copyWith(values: abcList.values + ['D']);
    });
  }
}
