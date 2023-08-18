import 'infrastructure/environment/environment.dart';
import 'main.dart';

void main() {
  Environment.instance.initConfig(Environment.wireViewer);
  return internalMain();
}
