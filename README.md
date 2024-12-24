# databank

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.


## Setup
```bash
dart pub global activate flutterfire_cli && flutterfire configure --project=netserve-innovations --ios-bundle-id=com.netservemarketplace.vendor --android-package-name=com.netservemarketplace.vendor && FLUTTER_BASE_HREF='/vendor-app/' flutter create . --org com.netservemarketplace && flutter pub get && dart run flutter_native_splash:create && dart run flutter_launcher_icons && dart run launcher_name:main && dart run change_app_package_name:main com.netservemarketplace.vendor
```