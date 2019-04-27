import 'package:angular/angular.dart';
import 'package:loading_components/app_component.template.dart' as ng;
import 'package:angular_router/angular_router.dart';

import 'main.template.dart' as self;

const useHashLS = false;
@GenerateInjector(
  routerProvidersHash, // You can use routerProviders in production
)
final InjectorFactory injector = self.injector$Injector;

void main() {
  runApp(ng.AppComponentNgFactory, createInjector: injector);
}
