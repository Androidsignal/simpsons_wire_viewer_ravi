abstract class BaseConfig {
  String get appName;
}

abstract class BaseApi {
  String get baseUrl;

  String get characterUrl;
}

class SimpsonsViewerConfig implements BaseConfig {
  @override
  String get appName => 'Simpsons Character Viewer';
}

class WireViewerConfig implements BaseConfig {
  @override
  String get appName => 'The Wire Character Viewer';
}

class SimpsonsViewerApi implements BaseApi {
  @override
  String get baseUrl => 'http://api.duckduckgo.com';

  @override
  String get characterUrl => '/?q=simpsons+characters&format=json';
}

class WireViewerApi implements BaseApi {
  @override
  String get baseUrl => 'http://api.duckduckgo.com';

  @override
  String get characterUrl => '/?q=the+wire+characters&format=json';
}
