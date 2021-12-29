import 'dart:developer';

import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpods_simple/data/app_error.dart';
import 'package:riverpods_simple/data/model/item.dart';
import 'package:riverpods_simple/ui/items_view_model.dart';

import 'article_item.dart';

class ItemList extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final itemsViewModel = ref.read(itemViewModelProvider);
    final items =
        ref.watch(itemViewModelProvider.select((value) => value.items));
    
    var _data = List<Item>.empty( growable: true);

    useFuture(
      useMemoized(() {
        return itemsViewModel.fetchItems();
      }, [items.toString()]),
    );

    return Stack(
      children: [
        items == null
            ? const Center(child: Text("No result"))
            : items.when(success: (data) {
                log("new data coming!");
                log(data.first.user.toString());
                if (data.isEmpty) {
                  return const Center(child: Text("No result"));
                }

                log("length(before): ${itemsViewModel.itemList.length}");
                itemsViewModel.itemList.addAll(data);

                log("length(after): ${itemsViewModel.itemList.length}");
                return ListView.builder(
                    itemCount: itemsViewModel.itemList.length + 1,
                    itemBuilder: (_, index) {
                      if(index == itemsViewModel.itemList.length) {
                          final page = (index / 20).ceil() + 1;
                          log("page: $page");
                          itemsViewModel.loadMore(page: page);
                          return const Center(child: Text("Loading"));
                      }
                      return ArticleItem(item: itemsViewModel.itemList[index], index: index);
                    });
              }, failure: (AppError error) {
                return const Center(child: Text("No result"));
              }),
        const SizedBox()
      ],
    );
  }
}
