import 'dart:developer';

import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpods_simple/ui/infos_view_model.dart';

import 'article_item.dart';

class InfoList extends HookConsumerWidget {
  const InfoList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final infosViewModel = ref.read(infoViewModelProvider);
    final info =
        ref.watch(infoViewModelProvider.select((value) => value.asyncInfo));

    useFuture(
      useMemoized(() {
        return infosViewModel.fetchItems();
      }),
    );

    return Stack(
      children: [
        info == null
            ? const Center(child: Text("No result"))
            : info.when(data: (data) {
                log("new data coming! length(after): ${data.length}");
                if (data.isEmpty) {
                  return const Center(child: Text("No result"));
                }
                return ListView.builder(
                    itemCount: data.length + 1,
                    itemBuilder: (_, index) {
                      if(index == data.length) {
                          final page = (index / 20).ceil() + 1;
                          infosViewModel.loadMore(page: page);
                          return const Center(child: Text("Loading"));
                      }
                      return ArticleItem(info: data[index], index: index);
                    });
              }, loading:() {
                return const Center(child: Text("Loading"));
              }
              , error: (_, __) {
                return const Center(child: Text("No result"));
              }),
        const SizedBox()
      ],
    );
  }
}
