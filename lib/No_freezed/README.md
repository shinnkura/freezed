## main.dart で行なっていること

```dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_example/No_freezed/abc_list.dart';
import 'package:freezed_example/No_freezed/fish.dart';

void main() {
  const app = MaterialApp(home: Home());
  const scope = ProviderScope(child: app);
  runApp(scope);
}

final fishProvider = StateProvider((ref) {
  return Fish(
    name: 'マグロ',
    size: 200,
    price: 300,
  );
});

final abcListProvider = StateProvider((ref) {
  return AbcList([
    'A',
    'B',
    'C',
  ]);
});

class Home extends ConsumerWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final fish = ref.watch(fishProvider);
    final abcList = ref.watch(abcListProvider);

    final nameText = Text('名前: ${fish.name}');
    final sizeText = Text('大きさ: ${fish.size} cm');
    final priceText = Text('値段: ${fish.price} 万円');
    final abcListText = Text('ABCリスト: ${abcList.values.join(', ')}');

    final button = ElevatedButton(
      onPressed: () => onPressed(ref),
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

  void onPressed(WidgetRef ref) {
    final fish = ref.watch(fishProvider);
    final newFish = fish.copyWith(price: 500);
    ref.read(fishProvider.notifier).state = newFish;

    final abcList = ref.watch(abcListProvider);
    final newAbcList = abcList.copyWith(values: abcList.values + ['D']);
    ref.read(abcListProvider.notifier).state = newAbcList;
  }
}

```
