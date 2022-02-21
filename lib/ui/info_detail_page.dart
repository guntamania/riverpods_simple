import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:riverpods_simple/data/model/info.dart';
import 'package:riverpods_simple/hook/use_router.dart';

class InfoDetailPage extends HookWidget {
  const InfoDetailPage({
    Key? key,
    @QueryParam('info') this.info,
  }) : super(key: key);

  final Info? info;

  @override
  Widget build(BuildContext context) {
    assert(info != null, "Info is required.");
    final router = useRouter();
    return Scaffold(
      body: GestureDetector(
        child: Center(
          child: Hero(
            tag: info!,
            child: Image.network(info!.download_url),
          ),
        ),
        onTap: router.pop,
      ),
    );
  }
}
