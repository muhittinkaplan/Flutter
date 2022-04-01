# change_icon_app

A new Flutter application.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.


```bash
0. seçilen logonun ön yüzü ve backgroundu ayrı ayrı hazırlanır.


1. pubspec.yml dosyasi içerisine 
    dev_dependencies: 
      flutter_launcher_icons: "^0.9.0"
     
     eklenir

2. pubspec.yml içerisine
    flutter_icons:
      android: "launcher_icon"
      ios: true
      image_path: "assets/logo.png"
    
3. terminale
    a- (base) kaplans@kaplans:~/AndroidStudioProjects/change_icon_app$ flutter pub get
    b- (base) kaplans@kaplans:~/AndroidStudioProjects/change_icon_app$ flutter packages get
    c- (base) kaplans@kaplans:~/AndroidStudioProjects/change_icon_app$ flutter packages pub run
     flutter_launcher_icons:main

    yazılır
'''
