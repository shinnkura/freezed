import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_example/No_freezed/abc_list.dart';
import 'package:freezed_example/No_freezed/fish.dart';

void main() {
  runApp(const ProviderScope(child: MaterialApp(home: Home())));
}

final fishProvider = StateProvider((ref) => Fish(name: 'マグロ', size: 200, price: 300));
final abcListProvider = StateProvider((ref) => AbcList(['A', 'B', 'C']));

class Home extends ConsumerWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final fish = ref.watch(fishProvider);
    final abcList = ref.watch(abcListProvider);

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildText('名前: ${fish.name}'),
            _buildText('大きさ: ${fish.size} cm'),
            _buildText('値段: ${fish.price} 万円'),
            _buildText('ABCリスト: ${abcList.values.join(', ')}'),
            ElevatedButton(
              onPressed: () => _onPressed(ref),
              child: const Text('変更する'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildText(String text) => Text(text);

  void _onPressed(WidgetRef ref) {
    _updateFish(ref);
    _updateAbcList(ref);
  }

  void _updateFish(WidgetRef ref) {
    final fish = ref.read(fishProvider.notifier).state;
    final newFish = fish.copyWith(price: 500);
    ref.read(fishProvider.notifier).state = newFish;
  }

  void _updateAbcList(WidgetRef ref) {
    final abcList = ref.read(abcListProvider.notifier).state;
    final newAbcList = abcList.copyWith(values: abcList.values + ['D']);
    ref.read(abcListProvider.notifier).state = newAbcList;
  }
}
