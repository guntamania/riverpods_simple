
import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:retrofit/http.dart';
import 'package:riverpods_simple/data/model/item.dart';
import 'app_dio.dart';

part 'item_data_source.g.dart';

final itemDataSourceProvider = Provider((ref) => ItemDataSource(ref.read));
@RestApi()
abstract class ItemDataSource {
  factory ItemDataSource(Reader reader) => _ItemDataSource(reader(dioProvider));

  @GET('/v2/items')
  Future<List<Item>> getItems({
    @Query("page") required String page,
    @Query("per_page") required String perPage,
  });
}