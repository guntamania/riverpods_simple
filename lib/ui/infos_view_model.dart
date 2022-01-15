import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpods_simple/data/model/info.dart';
import 'package:riverpods_simple/data/repository/info_api_repository.dart';
import 'package:riverpods_simple/data/repository/info_api_repository_impl.dart';

final infoViewModelProvider =
    ChangeNotifierProvider((ref) => InfoViewModel(ref.read));

class InfoViewModel extends ChangeNotifier {
  InfoViewModel(this._reader);

  final Reader _reader;

  late final InfoApiRepository _itemApiRepository = _reader(infoApiRepositoryProvider);

  AsyncValue<List<Info>>? _asyncInfo;
  AsyncValue<List<Info>>? get asyncInfo => _asyncInfo;

  List<Info> _itemList = [];

  Future<void> fetchItems() async {
    try {
      _itemList = await _itemApiRepository
          .getInfos(page: 1);
      _asyncInfo = AsyncValue.data(_itemList);
    } on Exception catch (e) {
      _asyncInfo =  AsyncValue.error(e);
    } finally {
      notifyListeners();
    }
  }

  Future<void> loadMore({required int page}) async {
    try {
      _itemList += await _itemApiRepository
          .getInfos(page: page);
      _asyncInfo = AsyncValue.data(_itemList);
    } on Exception catch (e) {
      _asyncInfo =  AsyncValue.error(e);
    } finally {
      notifyListeners();
    }
  }
}