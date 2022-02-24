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
import 'package:flutter/material.dart' as _i4;

import '../data/model/info.dart' as _i5;
import '../ui/info_detail_page.dart' as _i2;
import '../ui/info_home.dart' as _i1;

class AppRouter extends _i3.RootStackRouter {
  AppRouter([_i4.GlobalKey<_i4.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i3.PageFactory> pagesMap = {
    InfoHome.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.InfoHome());
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
        _i3.RouteConfig(InfoHome.name, path: '/'),
        _i3.RouteConfig(InfoDetailRoute.name, path: 'detail')
      ];
}

/// generated route for
/// [_i1.InfoHome]
class InfoHome extends _i3.PageRouteInfo<void> {
  const InfoHome() : super(InfoHome.name, path: '/');

  static const String name = 'InfoHome';
}

/// generated route for
/// [_i2.InfoDetailPage]
class InfoDetailRoute extends _i3.PageRouteInfo<InfoDetailRouteArgs> {
  InfoDetailRoute({_i4.Key? key, _i5.Info? info})
      : super(InfoDetailRoute.name,
            path: 'detail',
            args: InfoDetailRouteArgs(key: key, info: info),
            rawQueryParams: {'info': info});

  static const String name = 'InfoDetailRoute';
}

class InfoDetailRouteArgs {
  const InfoDetailRouteArgs({this.key, this.info});

  final _i4.Key? key;

  final _i5.Info? info;

  @override
  String toString() {
    return 'InfoDetailRouteArgs{key: $key, info: $info}';
  }
}
