import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'navigation_drawer_event.dart';
part 'navigation_drawer_state.dart';

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
    /* TODO: LUEGO QUITAR */
    List<NavItem> kk = [
      NavItem.page_one,
      NavItem.page_two,
      NavItem.page_three,
      NavItem.page_four,
      NavItem.page_five,
      NavItem.page_six,
    ];
    final indexOrigin =
        kk.firstWhere((element) => element == state.selectedItem).index;
    print(indexOrigin);
    final indexResult = indexOrigin < kk.length - 1 ? indexOrigin + 1 : 0;
    print(indexResult);
    destination = kk[indexResult];
    /* TODO: LUEGO QUITAR */

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
