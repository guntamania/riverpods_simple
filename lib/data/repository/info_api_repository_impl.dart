import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpods_simple/data/model/info.dart';
import 'package:riverpods_simple/data/model/result.dart';
import 'package:riverpods_simple/data/remote/info_data_source.dart';
import 'package:riverpods_simple/data/repository/info_api_repository.dart';

final infoApiRepositoryProvider =
    Provider((ref) => InfoApiRepositoryImpl(ref.read));

class InfoApiRepositoryImpl extends InfoApiRepository {
  InfoApiRepositoryImpl(this._reader);

  final Reader _reader;
  late final InfoDataSource _dataSource = _reader(infoDataSourceProvider);

  @override
  Future<Result<List<Info>>> getItems({int page = 1}) {
    return Result.guardFuture(
        () async => await _dataSource.getItems(page: page.toString(), limit: "20"));
  }

  @override
  FutureBuilder getItemsFuture(Function<Widget>(BuildContext, AsyncSnapshot<List<Info>>) builder) {
    return FutureBuilder<List<Info>>(
      future: _dataSource.getItems(page: "1".toString(), limit: "20"),
      builder: (BuildContext context, AsyncSnapshot<List<Info>> snapshot) {
        return builder(context, snapshot);
      },
    );
  }
}
