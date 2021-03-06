import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'side_menu_event.dart';
part 'side_menu_state.dart';

class NavigationDrawerBloc
    extends Bloc<NavigationDrawerEvent, NavigationDrawerState> {
  NavigationDrawerBloc() : super(NavigationDrawerState());

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  GlobalKey<ScaffoldState> get scaffoldKey {
    return _scaffoldKey;
  }

  @override
  Stream<NavigationDrawerState> mapEventToState(
    NavigationDrawerEvent event,
  ) async* {
    if (event is NavigateTo) {
      yield await _mapNavigateToState(state, event.destination);
    } else if (event is OpenDrawer) {
      yield await _mapOpenDrawerState(state);
    }
  }

  Future<NavigationDrawerState> _mapNavigateToState(
      NavigationDrawerState state, NavItem destination) async {
    /* TODO: THEN REMOVE */
    if (destination == NavItem.page_null) {
      List<NavItem> fakeNav = [
        NavItem.page_one,
        NavItem.page_two,
        NavItem.page_three,
        NavItem.page_four,
        NavItem.page_five,
        NavItem.page_six,
        NavItem.page_seven,
      ];
      final indexOrigin =
          fakeNav.firstWhere((element) => element == state.selectedItem).index;
      print(indexOrigin);
      final indexResult =
          indexOrigin < fakeNav.length - 1 ? indexOrigin + 1 : 0;
      print(indexResult);
      destination = fakeNav[indexResult];
    }
    /* TODO: THEN REMOVE */

    if (state.selectedItem != destination) {
      return state.copyWith(selectedItem: destination);
    }
    return state;
  }

  Future<NavigationDrawerState> _mapOpenDrawerState(
      NavigationDrawerState state) async {
    if (!_scaffoldKey.currentState!.isDrawerOpen) {
      _scaffoldKey.currentState!.openDrawer();
    }
    return state;
  }
}
