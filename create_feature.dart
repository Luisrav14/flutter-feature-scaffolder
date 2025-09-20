// ignore_for_file: unnecessary_string_escapes

import 'dart:io';

void main(List<String> args) {
  if (args.isEmpty) {
    print('❌ Debes especificar el nombre de la feature. Ejemplo:');
    print('dart run tools/create_feature.dart products');
    exit(1);
  }

  final feature = args.first;
  final basePath = 'lib/features/$feature';

  final folders = [
    '$basePath/domain/entities',
    '$basePath/domain/datasources',
    '$basePath/domain/repositories',
    '$basePath/infrastructure/models',
    '$basePath/infrastructure/mappers',
    '$basePath/infrastructure/datasources',
    '$basePath/infrastructure/repositories',
    '$basePath/presentation/providers',
    '$basePath/presentation/screens',
    '$basePath/presentation/widgets',
  ];

  for (var folder in folders) {
    Directory(folder).createSync(recursive: true);
  }

  // Archivos barril domain
  File('$basePath/domain/domain.dart')
    ..createSync()
    ..writeAsStringSync(
        "export 'entities/entities.dart';\nexport 'datasources/datasources.dart';\nexport 'repositories/repositories.dart';");
  File('$basePath/domain/entities/entities.dart')
    ..createSync()
    ..writeAsStringSync("export '$feature.dart';");
  File('$basePath/domain/datasources/datasources.dart')
    ..createSync()
    ..writeAsStringSync("export '$feature\_datasource.dart';");
  File('$basePath/domain/repositories/repositories.dart')
    ..createSync()
    ..writeAsStringSync("export '$feature\_repository.dart';");

  // Clases principales domain
  File('$basePath/domain/entities/$feature.dart')
    ..createSync()
    ..writeAsStringSync('''
class ${_capitalize(feature)} {
  // TODO: definir propiedades
}

class ${_capitalize(feature)}Item {
  // TODO: definir propiedades
}
''');
  File('$basePath/domain/datasources/$feature\_datasource.dart')
    ..createSync()
    ..writeAsStringSync('''
abstract class ${_capitalize(feature)}Datasource {
  // TODO: definir métodos abstractos
}
''');
  File('$basePath/domain/repositories/$feature\_repository.dart')
    ..createSync()
    ..writeAsStringSync('''
abstract class ${_capitalize(feature)}Repository {
  // TODO: definir métodos abstractos
}
''');

  // Archivos barril infrastructure
  File('$basePath/infrastructure/infrastructure.dart')
    ..createSync()
    ..writeAsStringSync(
        "export 'models/models.dart';\nexport 'mappers/mappers.dart';\nexport 'datasources/datasource.dart';\nexport 'repositories/repositories.dart';");
  File('$basePath/infrastructure/models/models.dart')
    ..createSync()
    ..writeAsStringSync("export '$feature\_model.dart';");
  File('$basePath/infrastructure/mappers/mappers.dart')
    ..createSync()
    ..writeAsStringSync("export '$feature\_mapper.dart';");
  File('$basePath/infrastructure/datasources/datasource.dart')
    ..createSync()
    ..writeAsStringSync("export '$feature\_datasource_impl.dart';");
  File('$basePath/infrastructure/repositories/repositories.dart')
    ..createSync()
    ..writeAsStringSync("export '$feature\_repository_impl.dart';");

  // Clases principales infrastructure
  File('$basePath/infrastructure/models/$feature\_model.dart')
    ..createSync()
    ..writeAsStringSync('''
class ${_capitalize(feature)}Model {
  // TODO: definir propiedades
}
''');
  File('$basePath/infrastructure/mappers/$feature\_mapper.dart')
    ..createSync()
    ..writeAsStringSync('''
import '../models/${feature}_model.dart';
import '../../domain/entities/$feature.dart';

class ${_capitalize(feature)}Mapper {
  static ${_capitalize(feature)} jsonToEntity(${_capitalize(feature)}Model json) => ${_capitalize(feature)}();
}
''');
  File('$basePath/infrastructure/datasources/$feature\_datasource_impl.dart')
    ..createSync()
    ..writeAsStringSync('''
import '../../domain/datasources/${feature}_datasource.dart';

class ${_capitalize(feature)}DatasourceImpl extends ${_capitalize(feature)}Datasource {
  // TODO: implementar métodos
}
''');
  File('$basePath/infrastructure/repositories/$feature\_repository_impl.dart')
    ..createSync()
    ..writeAsStringSync('''
import '../../domain/repositories/${feature}_repository.dart';

class ${_capitalize(feature)}RepositoryImpl extends ${_capitalize(feature)}Repository {
  // TODO: implementar métodos
}
''');

  // Archivos barril presentation
  File('$basePath/presentation/presentation.dart')
    ..createSync()
    ..writeAsStringSync(
        "export 'screens/screens.dart';\nexport 'widgets/widgets.dart';\nexport 'providers/providers.dart';");
  File('$basePath/presentation/screens/screens.dart')
    ..createSync()
    ..writeAsStringSync('');
  File('$basePath/presentation/widgets/widgets.dart')
    ..createSync()
    ..writeAsStringSync('');
  File('$basePath/presentation/providers/providers.dart')
    ..createSync()
    ..writeAsStringSync('');

  print('✅ Módulo "$feature" creado correctamente en $basePath');
}

String _capitalize(String text) =>
    text.isEmpty ? text : text[0].toUpperCase() + text.substring(1);
