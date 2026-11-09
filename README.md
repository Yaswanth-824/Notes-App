# Notes App

A Flutter app for writing and organizing notes on a device. You can create, edit and delete notes. Hive keeps notes in local storage.

## Run locally

Install a Flutter SDK that includes Dart 3.12.2 or newer within Dart 3. From the repository root run:

```sh
flutter pub get
flutter run
```

Choose a connected device or browser when Flutter prompts. For a web development preview use `flutter run -d chrome`.

## Code map

- `lib/notes/` contains the home, edit, add and settings screens.
- `lib/models/` defines the note model and Hive adapter.
- `lib/widget/` contains reusable widgets.
- `pubspec.yaml` declares dependencies and `pubspec.lock` records resolved versions.

The repo includes a web target. Notes saved in the browser belong to that browser and site origin.
