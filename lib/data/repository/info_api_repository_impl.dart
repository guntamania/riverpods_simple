import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpods_simple/data/model/info.dart';
import 'package:riverpods_simple/data/remote/info_data_source.dart';
import 'package:riverpods_simple/data/repository/info_api_repository.dart';

final infoApiRepositoryProvider =
    Provider((ref) => InfoApiRepositoryImpl(ref.read));

class InfoApiRepositoryImpl extends InfoApiRepository {
  InfoApiRepositoryImpl(this._reader);

  final Reader _reader;
  late final InfoDataSource _dataSource = _reader(infoDataSourceProvider);

  @override
  Future<List<Info>> getInfos({int page = 1}) {
    return _dataSource.getItems(page: page.toString(), limit: "20");
  }
}
