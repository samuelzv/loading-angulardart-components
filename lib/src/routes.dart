import 'package:angular_router/angular_router.dart';

import './bar/bar_component.template.dart' as bar_ng;
import './lazy/lazy_component.template.dart' deferred as lazy_ng;
import 'route_paths.dart';

export 'route_paths.dart';

class Routes {
  static final bar = RouteDefinition(
    routePath: RoutePaths.bar,
    component: bar_ng.BarComponentNgFactory 
  );

  static final lazy = RouteDefinition.defer(
    routePath: RoutePaths.lazy,
    loader: () async {
      await lazy_ng.loadLibrary();
      return lazy_ng.LazyComponentNgFactory;
    }
  );

  static final all = <RouteDefinition> [
    bar,
    lazy,
    RouteDefinition.redirect(
      path: '',
      redirectTo: RoutePaths.bar.toUrl()
    )
  ];

}