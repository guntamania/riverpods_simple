// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i3;
import 'package:flutter/cupertino.dart' as _i5;
import 'package:flutter/material.dart' as _i4;

import '../data/model/info.dart' as _i6;
import '../ui/info_detail_page.dart' as _i2;
import '../ui/info_list.dart' as _i1;

class AppRouter extends _i3.RootStackRouter {
  AppRouter([_i4.GlobalKey<_i4.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i3.PageFactory> pagesMap = {
    InfoList.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.InfoList());
    },
    InfoDetailRoute.name: (routeData) {
      final queryParams = routeData.queryParams;
      final args = routeData.argsAs<InfoDetailRouteArgs>(
          orElse: () => InfoDetailRouteArgs(info: queryParams.get('info')));
      return _i3.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i2.InfoDetailPage(key: args.key, info: args.info));
    }
  };

  @override
  List<_i3.RouteConfig> get routes => [
        _i3.RouteConfig(InfoList.name, path: '/'),
        _i3.RouteConfig(InfoDetailRoute.name, path: 'detail')
      ];
}

/// generated route for
/// [_i1.InfoList]
class InfoList extends _i3.PageRouteInfo<void> {
  const InfoList() : super(InfoList.name, path: '/');

  static const String name = 'InfoList';
}

/// generated route for
/// [_i2.InfoDetailPage]
class InfoDetailRoute extends _i3.PageRouteInfo<InfoDetailRouteArgs> {
  InfoDetailRoute({_i5.Key? key, _i6.Info? info})
      : super(InfoDetailRoute.name,
            path: 'detail',
            args: InfoDetailRouteArgs(key: key, info: info),
            rawQueryParams: {'info': info});

  static const String name = 'InfoDetailRoute';
}

class InfoDetailRouteArgs {
  const InfoDetailRouteArgs({this.key, this.info});

  final _i5.Key? key;

  final _i6.Info? info;

  @override
  String toString() {
    return 'InfoDetailRouteArgs{key: $key, info: $info}';
  }
}
