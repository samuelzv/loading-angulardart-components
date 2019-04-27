import 'package:angular/angular.dart';

import 'src/foo/foo_component.template.dart' as foo;
import 'src/bar/bar_component.template.dart' as bar;
import 'src/lazy/lazy_component.template.dart' deferred as lazy;

// AngularDart info: https://webdev.dartlang.org/angular
// Components info: https://webdev.dartlang.org/components

@Component(
  selector: 'my-app',
  styleUrls: ['app_component.css'],
  templateUrl: 'app_component.html',
)
class AppComponent {
  final ComponentLoader _loader;
   @ViewChild('currentComponent', read: ViewContainerRef)
  ViewContainerRef currentComponent;

  AppComponent(this._loader);

  void loadImperativillyComponent(String name) {
    final component = name == 'foo' ? foo.FooComponentNgFactory : bar.BarComponentNgFactory;

    currentComponent.clear();
    _loader.loadNextToLocation(component, currentComponent); 
  }

  void loadLazyComponent() async {
    currentComponent.clear();
    await lazy.loadLibrary();
    _loader.loadNextToLocation(lazy.LazyComponentNgFactory, currentComponent); 
  }

}
