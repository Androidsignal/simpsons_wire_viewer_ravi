import 'basic_configs.dart';

class Environment {
  Environment._();

  static final Environment _instance = Environment._();

  static Environment get instance => _instance;

  static const String simpsonsViewer = 'simpsonsviewer';
  static const String wireViewer = 'wireviewer';

  static String _env = simpsonsViewer;

  late BaseConfig _config;

  late BaseApi _baseApi;

  bool get isSimpsonsViewer => _env == simpsonsViewer;

  BaseConfig get config => _config;

  BaseApi get baseApi => _baseApi;

  initConfig(String environment) {
    _env = environment;
    _config = _getConfig(environment);
    _baseApi = _getApi(environment);
  }

  BaseConfig _getConfig(String environment) {
    switch (environment) {
      case Environment.simpsonsViewer:
        return SimpsonsViewerConfig();
      case Environment.wireViewer:
        return WireViewerConfig();
      default:
        return SimpsonsViewerConfig();
    }
  }

  BaseApi _getApi(String environment) {
    switch (environment) {
      case Environment.simpsonsViewer:
        return SimpsonsViewerApi();
      case Environment.wireViewer:
        return WireViewerApi();
      default:
        return SimpsonsViewerApi();
    }
  }
}
