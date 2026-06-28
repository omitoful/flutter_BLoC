class HomeState {
  final int index;
  HomeState({this.index = 0});

  HomeState copyWith({int? index}) {
    return HomeState(index: index ?? this.index);
  }
}
