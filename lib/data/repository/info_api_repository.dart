import 'package:riverpods_simple/data/model/info.dart';

abstract class InfoApiRepository {
  Future<List<Info>> getInfos({int page = 1});
}
