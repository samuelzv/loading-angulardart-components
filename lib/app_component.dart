import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';

import 'src/foo/foo_component.template.dart' as foo;
import 'src/bar/bar_component.template.dart' as bar;
import 'src/lazy/lazy_component.template.dart' deferred as lazy;
import 'src/routes.dart';

@Component(
  selector: 'my-app',
  styleUrls: ['app_component.css'],
  exports: [Routes, RoutePaths],
  directives: [routerDirectives],
  templateUrl: 'app_component.html',
)
class AppComponent {
  final ComponentLoader _loader;
  final Router _router;
   @ViewChild('currentComponent', read: ViewContainerRef)
  ViewContainerRef currentComponent;

  AppComponent(this._loader, this._router);

  void loadImperativillyComponent(String name) {
    final component = name == 'foo' ? foo.FooComponentNgFactory : bar.BarComponentNgFactory;

    currentComponent.clear();
    _loader.loadNextToLocation(component, currentComponent); 
  }

  void loadLazyComponent()  {
    this._router.navigate(RoutePaths.lazy.toUrl());
  }
}
