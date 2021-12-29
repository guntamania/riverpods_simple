
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpods_simple/data/model/user.dart';

part 'item.freezed.dart';
part 'item.g.dart';

@freezed
abstract class Item with _$Item {
  factory Item({
    required String title,
    required User user,
    required String body,
  }) = _Item;

  factory Item.fromJson(Map<String, dynamic> json) => _$ItemFromJson(json);
}