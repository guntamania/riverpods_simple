
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpods_simple/data/model/item.dart';
import 'package:riverpods_simple/data/model/result.dart';
import 'package:riverpods_simple/data/repository/item_api_repository.dart';
import 'package:riverpods_simple/data/repository/item_api_repository_impl.dart';

final itemViewModelProvider =
    ChangeNotifierProvider((ref) => ItemViewModel(ref.read));

class ItemViewModel extends ChangeNotifier {
  ItemViewModel(this._reader);

  final Reader _reader;

  late final ItemApiRepository _itemApiRepository = _reader(itemApiRepositoryProvider);

  Result<List<Item>>? _items;

  Result<List<Item>>? get items => _items;

  // これをViewからいじるのをやめたい..
  List<Item> itemList = [];

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