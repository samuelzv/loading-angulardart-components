import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';
import 'package:angular_components/angular_components.dart';

import 'src/foo/foo_component.template.dart' as foo;
import 'src/bar/bar_component.dart';
import 'src/routes.dart';

@Component(
  selector: 'my-app',
  styleUrls: ['app_component.css'],
  exports: [Routes, RoutePaths],
  directives: [
    NgIf,
    routerDirectives,
    MaterialButtonComponent,
    BarComponent
  ],
  templateUrl: 'app_component.html',
)
class AppComponent {
  final ComponentLoader _loader;
  bool isVisibleDeferred;
  final Router _router;
   @ViewChild('targetComponent', read: ViewContainerRef)
  ViewContainerRef targetComponent;

  AppComponent(this._loader, this._router);

  void loadImperativelyComponent() {
    targetComponent.clear();
    _loader.loadNextToLocation(foo.FooComponentNgFactory, targetComponent); 
  }

  void loadLazyComponent()  {
    this._router.navigate(RoutePaths.lazy.toUrl());
  }

  void loadDeferredComponent() {
    isVisibleDeferred = true;
  }
}
