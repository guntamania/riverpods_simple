
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpods_simple/data/model/info.dart';
import 'package:riverpods_simple/data/model/result.dart';
import 'package:riverpods_simple/data/repository/info_api_repository.dart';
import 'package:riverpods_simple/data/repository/info_api_repository_impl.dart';

final infoViewModelProvider =
    ChangeNotifierProvider((ref) => InfoViewModel(ref.read));

class InfoViewModel extends ChangeNotifier {
  InfoViewModel(this._reader);

  final Reader _reader;

  late final InfoApiRepository _itemApiRepository = _reader(infoApiRepositoryProvider);

  Result<List<Info>>? _items;

  Result<List<Info>>? get items => _items;

  // これをViewからいじるのをやめたい..
  List<Info> itemList = [];

  Future<void> fetchItems() {
    return _itemApiRepository
        .getItems(page: 1)
        .then((value) => {
          _items = value
        })
        .whenComplete(notifyListeners);
  }

  Future<void> loadMore({required int page}) {
    return _itemApiRepository
        .getItems(page: page)
        .then((value) {
          _items = value;
        })
        .whenComplete(notifyListeners);
  }
}