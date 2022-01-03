
import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:retrofit/http.dart';
import 'package:riverpods_simple/data/model/info.dart';
import 'app_dio.dart';

part 'info_data_source.g.dart';

final infoDataSourceProvider = Provider((ref) => InfoDataSource(ref.read));
@RestApi()
abstract class InfoDataSource {
  factory InfoDataSource(Reader reader) => _InfoDataSource(reader(dioProvider));

  @GET('list')
  Future<List<Info>> getItems({
    @Query("page") required String page,
    @Query("limit") required String limit,
  });
}