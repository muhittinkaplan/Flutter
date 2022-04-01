# googlemap_app

A new Flutter application.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.


Todo
1-Pubspec.yaml içerisinde
    dependencies: içerisine 
        google_maps_flutter: ^2.0.1
    eklenir
2-googleMap api key i 
    android/app/src/main/AndroidManifest.xml içerisinde
       
       <application
            android:label="googlemap_app"
            android:icon="@mipmap/ic_launcher">
    
           <meta-data android:name="com.google.android.geo.API_KEY"
               android:value="A--------------------------------------"/>
    yazılır
    


