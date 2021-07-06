part of 'navigation_drawer_bloc.dart';

class NavigationDrawerState extends Equatable {
  const NavigationDrawerState({
    this.selectedItem = NavItem.page_one,
    this.openDrawer = false,
  });

  final NavItem selectedItem;
  final bool openDrawer;

  NavigationDrawerState copyWith({
    NavItem? selectedItem,
    bool? openDrawer,
  }) {
    return NavigationDrawerState(
      selectedItem: selectedItem ?? this.selectedItem,
      openDrawer: openDrawer ?? this.openDrawer,
    );
  }

  @override
  List<Object> get props => [selectedItem, openDrawer];
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
  page_null,
}
