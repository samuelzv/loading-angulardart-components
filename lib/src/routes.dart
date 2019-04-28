import 'package:angular_router/angular_router.dart';

import './lazy/lazy_component.template.dart' deferred as lazy_ng;
import 'route_paths.dart';

export 'route_paths.dart';

class Routes {
  static final lazy = RouteDefinition.defer(
    routePath: RoutePaths.lazy,
    loader: () async {
      await lazy_ng.loadLibrary();
      return lazy_ng.LazyComponentNgFactory;
    }
  );

  static final all = <RouteDefinition> [
    lazy
  ];

}