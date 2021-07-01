part of 'navigation_drawer_bloc.dart';

class NavigationDrawerState extends Equatable {
  const NavigationDrawerState({
    this.selectedItem = NavItem.page_one,
  });

  final NavItem selectedItem;

  NavigationDrawerState copyWith({
    NavItem? selectedItem,
    bool? openDrawer,
  }) {
    return NavigationDrawerState(
      selectedItem: selectedItem ?? this.selectedItem,
    );
  }

  @override
  List<Object> get props => [selectedItem];
}

// them to support your pages
enum NavItem {
  page_one,
  page_two,
  page_three,
  page_four,
  page_five,
  page_six,
  page_seven,
}
