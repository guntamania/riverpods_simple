import 'dart:developer';

import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpods_simple/data/app_error.dart';
import 'package:riverpods_simple/ui/infos_view_model.dart';

import 'article_item.dart';

class InfoList extends HookConsumerWidget {
  const InfoList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final infosViewModel = ref.read(infoViewModelProvider);
    final info =
        ref.watch(infoViewModelProvider.select((value) => value.items));

    useFuture(
      useMemoized(() {
        return infosViewModel.fetchItems();
      }, [info.toString()]),
    );

    return Stack(
      children: [
        info == null
            ? const Center(child: Text("No result"))
            : info.when(success: (data) {
                log("new data coming!");
                log(data.first.author.toString());
                if (data.isEmpty) {
                  return const Center(child: Text("No result"));
                }

                log("length(before): ${infosViewModel.itemList.length}");
                infosViewModel.itemList.addAll(data);

                log("length(after): ${infosViewModel.itemList.length}");
                return ListView.builder(
                    itemCount: infosViewModel.itemList.length + 1,
                    itemBuilder: (_, index) {
                      if(index == infosViewModel.itemList.length) {
                          final page = (index / 20).ceil() + 1;
                          log("page: $page");
                          infosViewModel.loadMore(page: page);
                          return const Center(child: Text("Loading"));
                      }
                      return ArticleItem(info: infosViewModel.itemList[index], index: index);
                    });
              }, failure: (AppError error) {
                return const Center(child: Text("No result"));
              }),
        const SizedBox()
      ],
    );
  }
}
