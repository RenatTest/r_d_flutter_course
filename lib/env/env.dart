import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(path: '.env.keys')
abstract class Env {
  @EnviedField(varName: 'TOKEN', obfuscate: true)
  static final String token = _Env.token;

  @EnviedField(varName: 'APIKEY', obfuscate: true)
  static final String apiKey = _Env.apiKey;
}
