import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpods_simple/data/model/info.dart';
import 'package:riverpods_simple/hook/use_router.dart';
import 'package:riverpods_simple/route/app_route.gr.dart';

class ArticleItem extends HookConsumerWidget {
  const ArticleItem({Key? key, required this.info, required this.index});

  final Info info;
  final int index;

  static BorderRadius borderRadiusTop = const BorderRadius.only(
    topRight: Radius.circular(8),
    topLeft: Radius.circular(8),
    bottomLeft: Radius.circular(0),
    bottomRight: Radius.circular(0),
  );

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = useRouter();
    return Card(
      margin: const EdgeInsets.all(12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      elevation: 2,
      child: InkWell(
        child: Padding(
            padding: const EdgeInsets.all(8),
            child: Column(children: <Widget>[
              Text("$index " + info.author),
              Text(info.url),
              Container(
                margin: const EdgeInsets.all(4),
                child: Image.network(
                  info.download_url,
                  height: 50,
                ),
              ),
            ])),
        onTap: () => router.push(InfoDetailRoute(info: info)),
      ),
    );
  }
}
