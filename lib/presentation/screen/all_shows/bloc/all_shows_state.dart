import 'package:equatable/equatable.dart';
import 'package:findseat/model/entity/entity.dart';
import 'package:findseat/presentation/screen/all_shows/bloc/all_shows_bloc.dart';

class AllShowsState extends Equatable {
  @override
  List<Object> get props => [];
}

class DisplayListShows extends AllShowsState {
  final Meta? meta;
  final bool loading;
  final String? msg;
  DisplayListShows(
      {required this.meta, required this.loading, required this.msg});

  factory DisplayListShows.loading() {
    return DisplayListShows(msg: null, meta: null, loading: true);
  }

  factory DisplayListShows.data(Meta meta) {
    return DisplayListShows(msg: null, meta: meta, loading: false);
  }

  factory DisplayListShows.error(String msg) {
    return DisplayListShows(msg: msg, meta: null, loading: false);
  }

  @override
  List<Object> get props => [];

  @override
  String toString() {
    return 'DisplayListShows{meta: $meta, loading: $loading, msg: $msg}';
  }
}

class UpdateToolbarState extends AllShowsState {
  final bool showSearchField;

  UpdateToolbarState({required this.showSearchField});

  @override
  List<Object> get props => [showSearchField];

  @override
  String toString() {
    return 'UpdateSearchIconState{showSearchIcon: $showSearchField}';
  }
}

class OpenSortOption extends AllShowsState {
  final bool isOpen;
  final SHOW_SORT_BY showSortBy;

  OpenSortOption({required this.isOpen, required this.showSortBy});

  @override
  List<Object> get props => [isOpen, showSortBy, DateTime.now().millisecond];

  @override
  String toString() {
    return 'OpenSortOption{isOpen: $isOpen, showSortBy: $showSortBy}';
  }
}
