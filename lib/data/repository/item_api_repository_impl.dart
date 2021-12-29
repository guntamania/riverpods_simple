import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpods_simple/data/model/item.dart';
import 'package:riverpods_simple/data/model/result.dart';
import 'package:riverpods_simple/data/remote/item_data_source.dart';
import 'package:riverpods_simple/data/repository/item_api_repository.dart';

final itemApiRepositoryProvider =
    Provider((ref) => ItemApiRepositoryImpl(ref.read));

class ItemApiRepositoryImpl extends ItemApiRepository {
  ItemApiRepositoryImpl(this._reader);

  final Reader _reader;
  late final ItemDataSource _dataSource = _reader(itemDataSourceProvider);

  @override
  Future<Result<List<Item>>> getItems({int page = 1}) {
    return Result.guardFuture(
        () async => await _dataSource.getItems(page: page.toString(), perPage: "20"));
  }

  @override
  FutureBuilder getItemsFuture(Function<Widget>(BuildContext, AsyncSnapshot<List<Item>>) builder) {
    return FutureBuilder<List<Item>>(
      future: _dataSource.getItems(page: "1".toString(), perPage: "20"),
      builder: (BuildContext context, AsyncSnapshot<List<Item>> snapshot) {
        return builder(context, snapshot);
      },
    );
  }
}
