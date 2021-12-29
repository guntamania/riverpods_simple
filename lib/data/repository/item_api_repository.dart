import 'package:flutter/widgets.dart';
import 'package:riverpods_simple/data/model/item.dart';
import 'package:riverpods_simple/data/model/result.dart';

abstract class ItemApiRepository {
  Future<Result<List<Item>>> getItems({int page});

  FutureBuilder getItemsFuture(
      Function<Widget>(BuildContext, AsyncSnapshot<List<Item>>) builder);
}
