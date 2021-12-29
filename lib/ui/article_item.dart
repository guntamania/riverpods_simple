
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpods_simple/data/model/item.dart';

class ArticleItem extends HookConsumerWidget {
  const ArticleItem({
      Key? key,
    required this.item,
    required this.index
  });

  final Item item;
  final int index;

  static BorderRadius borderRadiusTop = const BorderRadius.only(
    topRight: Radius.circular(8),
    topLeft: Radius.circular(8),
    bottomLeft: Radius.circular(0),
    bottomRight: Radius.circular(0),
  );


  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      margin: const EdgeInsets.all(12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      elevation: 2,
      child: Card(
        child: Column(
          children:<Widget>[
            Text("$index " + item.title),
            Text(item.user.name)
          ]
        )
      )
    );
  }
}