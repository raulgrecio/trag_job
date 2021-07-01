part of 'navigation_drawer_bloc.dart';

abstract class NavigationDrawerEvent extends Equatable {
  const NavigationDrawerEvent();

  @override
  List<Object> get props => [];
}

class NavigateTo extends NavigationDrawerEvent {
  final NavItem destination;

  NavigateTo(this.destination);
}

class OpenDrawer extends NavigationDrawerEvent {
  OpenDrawer();
}
