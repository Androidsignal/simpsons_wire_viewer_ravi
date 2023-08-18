import 'package:flutter_test/flutter_test.dart';
import 'package:simpsons_character_viewer/infrastructure/environment/environment.dart';
import 'package:simpsons_character_viewer/infrastructure/repository/data_repository.dart';

void main() {
  test('Fetch Api', () async {
    bool done = false;
    Environment.instance.initConfig(Environment.simpsonsViewer);
    var result = await DataRepository().fetchData();
    if (result.isSuccess) {
      done = true;
    }
    expect(done, true);
  });
}
