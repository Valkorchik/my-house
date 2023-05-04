# my-house
<h4>
 My House - is a mobile application that is providing opportunity to manage your real estate and buy a new one.  
</h4>
 
 
 # Самостоятельная сборка проекта
1. Установите стабильную версию Flutter 2.8.1 для своей операционной системы, используя [руководство на странице документации](https://docs.flutter.dev/get-started/install). 
2. Установить зависимости пакетов:
```
flutter pub get
```
3. Откройте эмулятор устройства, а затем запустите проект, выполнив команду:
```
flutter run
```
4. Используйте одну из этих команд для сборки проекта:
```
flutter build apk
flutter build ios
flutter build appbundle
```
5. Если возникнут какие-либо проблемы при выполнении предыдущих действий, выполните приведенную ниже команду для анализа и устанения неполадок:
```
flutter doctor
```

## Генерация кода
Пакеты **freezed** и **auto_route** генерируют код для API моделей данных и навигации.
Используйте флаг [watch], чтобы следить за изменениями в файловой системе и перестраивать код при необходимости.
```
flutter packages pub run build_runner watch --delete-conflicting-outputs
```

Если вы хотите, чтобы генератор запустился один раз и завершил работу, используйте
```
flutter packages pub run build_runner build --delete-conflicting-outputs
```
 ## При ошибках
**Исключения платформы**
1. flutter clean
2. flutter pub get
3. flutter run

**Любое исключение пакета (зависимости)**
- Удалите pubspec.lock файл

Выполните следующие команды:
1. flutter clean
2. flutter pub cache repair
3. flutter pub get
4. flutter run
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 <br>
 Application doesnt providing real money transfer and an official document flow.
</br>
