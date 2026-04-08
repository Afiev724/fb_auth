import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      throw UnsupportedError(
        'DefaultFirebaseOptions are not configured for web - run FlutterFire CLI.',
      );
    }

    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
      case TargetPlatform.windows:
      case TargetPlatform.linux:
      case TargetPlatform.fuchsia:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not configured for this platform.',
        );
    }
  }

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDAe0_stFP9y-FuLJ6KwWTN-HAMJwwCOb8',
    appId: '1:121840570476:android:8497e9b5dd5af58aca0849',
    messagingSenderId: '121840570476',
    projectId: 'fb-authentication-16b41',
    storageBucket: 'fb-authentication-16b41.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAe2157SvQHUjo_lEkeqi7IfvLIyfMAFdM',
    appId: '1:121840570476:ios:63f842655f37f1e1ca0849',
    messagingSenderId: '121840570476',
    projectId: 'fb-authentication-16b41',
    storageBucket: 'fb-authentication-16b41.firebasestorage.app',
    iosBundleId: 'com.example.fbAuth',
  );
}
