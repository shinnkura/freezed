class AbcList {
  final List<String> values;

  AbcList(this.values);

  AbcList copyWith({
    List<String>? values,
  }) {
    return AbcList(
      values ?? this.values,
    );
  }
}