import 'package:firebase_messaging/firebase_messaging.dart';
import 'dart:io';
class PushNotificationService{
  FirebaseMessaging _fcm = FirebaseMessaging();

  void getPermission() {
    _fcm.requestNotificationPermissions();
  }

  Future<String> getToken() async {
    final token = _fcm.getToken();
    return token;
  }

  Future initialise() async{
    if(Platform.isIOS){
      _fcm.requestNotificationPermissions(IosNotificationSettings());
    }

    _fcm.configure(//onforeground
      onMessage: (Map<String,dynamic> message) async{
        print('OnMessage : $message');
      },
      //when closed but opened again
      onLaunch: (Map<String,dynamic> message) async{
        print('OnLaunch : $message');
      },
      //called when app is background
      onResume: (Map<String,dynamic> message) async{
        print('OnResume : $message');
      },
    );
  }
}