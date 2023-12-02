# create
catalunha@pop-os:~$ flutter create --project-name=fluxus5 --org br.com.proclinicakids --platforms android,web ./fluxus5

# config
## pubspec.yaml
Configure o pubspec.yaml executando as linhas a seguir no terminal

## state manager
```
flutter pub add flutter_riverpod
flutter pub add riverpod_annotation
flutter pub add freezed_annotation
flutter pub add json_annotation

flutter pub add dev:riverpod_generator
flutter pub add dev:build_runner
flutter pub add dev:custom_lint
flutter pub add dev:riverpod_lint
flutter pub add dev:freezed
flutter pub add dev:json_serializable
```
## others


## analysis_options.yaml
Copia as linhas a seguir no final do arquivo analysis_options.yaml
```
# Riverpod
analyzer:
  plugins:
    - custom_lint
  exclude:
    - "**/*.g.dart"
    - "**/*.freezed.dart"
  errors:
    invalid_annotation_target: ignore
```
