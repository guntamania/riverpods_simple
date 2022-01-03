import 'package:flutter/widgets.dart';
import 'package:riverpods_simple/data/model/info.dart';
import 'package:riverpods_simple/data/model/result.dart';

abstract class InfoApiRepository {
  Future<Result<List<Info>>> getItems({int page});

  FutureBuilder getItemsFuture(
      Function<Widget>(BuildContext, AsyncSnapshot<List<Info>>) builder);
}
