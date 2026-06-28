abstract class HomeEvent {
  HomeEvent();
}

class HomePageDots extends HomeEvent {
  final int index;
  HomePageDots(this.index);
}
