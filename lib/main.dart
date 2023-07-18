import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_example/abc_list.dart';
import 'package:freezed_example/fish.dart';

void main() {
  runApp(const ProviderScope(child: MaterialApp(home: Home())));
}

class FishNotifier extends StateNotifier<Fish> {
  FishNotifier() : super(const Fish(name: 'マグロ', size: 200, price: 300));

  void updatePrice() {
    state = state.copyWith(price: 500);
  }
}

class AbcListNotifier extends StateNotifier<AbcList> {
  AbcListNotifier() : super(AbcList(['A', 'B', 'C']));

  void addValue(String value) {
    state = state.copyWith(values: state.values + [value]);
  }
}

final fishProvider = StateNotifierProvider<FishNotifier, Fish>((ref) => FishNotifier());
final abcListProvider = StateNotifierProvider<AbcListNotifier, AbcList>((ref) => AbcListNotifier());

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
            Text('名前: ${fish.name}'),
            Text('大きさ: ${fish.size} cm'),
            Text('値段: ${fish.price} 万円'),
            Text('ABCリスト: $abcList'),
            ElevatedButton(
              onPressed: () {
                ref.read(fishProvider.notifier).updatePrice();
                ref.read(abcListProvider.notifier).addValue('D');
              },
              child: const Text('変更する'),
            ),
          ],
        ),
      ),
    );
  }
}
