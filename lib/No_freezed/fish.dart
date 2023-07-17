class Fish {
  final String name;
  final int size;
  final int price;

  const Fish({
    required this.name,
    required this.size,
    required this.price,
  });

  Fish copyWith({
    String? name,
    int? size,
    int? price,
  }) {
    return Fish(
      name: name ?? this.name,
      size: size ?? this.size,
      price: price ?? this.price,
    );
  }
}