import 'infrastructure/environment/environment.dart';
import 'main.dart';

void main() {
  Environment.instance.initConfig(Environment.simpsonsViewer);
  return internalMain();
}
