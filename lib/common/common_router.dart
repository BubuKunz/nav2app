import 'package:alt_bloc/alt_bloc.dart';
import 'package:flutter/material.dart';

import '../main.dart';

class ScreenRouter with ErrorsRouter implements BaseRouter {
  ScreenRouter(this._routesMap);

  final Map<String, Future Function(BuildContext, String, dynamic)> _routesMap;

  @override
  Future onRoute(BuildContext context, String name, args) {
    return _routesMap.containsKey(name) ? _routesMap[name](context, name, args) : super.onRoute(context, name, args);
  }
}

mixin ErrorsRouter implements BaseRouter {
  static const connectionErrorRoute = '/connection-error';
  static const unexpectedErrorRoute = '/unexpected-error';

  static final _routesMapper = <String, Router>{
    connectionErrorRoute: (context, routeName, args) => showConnectionErrorDialog(context),
    unexpectedErrorRoute: (context, routeName, args) => showUnexpectedErrorDialog(context),
  };

  @override
  Future onRoute(BuildContext context, String name, dynamic args) {
    if (!_routesMapper.containsKey(name) && isInDebugMode) {
      throw FlutterError('Handler for route with name: $name and arguments: $args wasn\'t defined in app');
    }
    return _routesMapper[name].call(context, name, args);
  }
}

Future showConnectionErrorDialog(BuildContext context) {
  return showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          title: Text('No internet connection.'),
          content: Text('Probably some issues with your internet connection. Please, check and try again.'),
        );
      });
}

Future showUnexpectedErrorDialog(BuildContext context) {
  return showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          title: Text('Oops!'),
          content: Text('Sorry for that, but something went wrong. We\'re working on it.'),
        );
      });
}

abstract class BaseRouter {
  Future onRoute(BuildContext context, String name, dynamic args);
}
