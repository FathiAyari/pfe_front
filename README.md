# comparator-mobile

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.


##Ressources
card.png[card image](https://www.flaticon.com/free-icon/gift-card_1240340?term=loyalty%20card&page=1&position=31&page=1&position=31&related_id=1240340&origin=search)
friends.json[friends animation lottie](https://lottiefiles.com/67654-networking-for-all)
home.png[friends animation lottie](https://www.flaticon.com/free-icon/home_1946488?term=home&page=1&position=2&page=1&position=2&related_id=1946488&origin=search)
loading.json[loading lottie](https://lottiefiles.com/search?q=loading&category=animations&animations-page=2)
money.json[money lottie](https://lottiefiles.com/search?q=money&category=animations)
profil.png[profil icon](https://www.flaticon.com/free-icon/user_709579?term=profile&page=1&position=23&page=1&position=23&related_id=709579&origin=search)
reset_password.json[reset password](https://lottiefiles.com/search?q=reset%20password&category=animations)
saved.png[saved items](https://www.flaticon.com/search?word=saved&order_by=4)
scan.josn[scan bar code](https://lottiefiles.com/search?q=scan&category=animations)
sign_in.json[sign in lottie](https://lottiefiles.com/53395-login)
sign_up.json[sign up lottie](https://lottiefiles.com/search?q=sign+up&category=animations&animations-page=1)
welcome.json[welcome lottie](https://lottiefiles.com/75705-welcome-animation)
facebook.png[welcome lottie](https://www.flaticon.com/premium-icon/facebook_3128304?term=facebook&page=1&position=18&page=1&position=18&related_id=3128304&origin=search)

##Documentation:


Facebook auth application:
-access to this this link to create an application [create your first app here ](https://developers.facebook.com/)
-choose the plateforme (android,ios)
-go to my application and create a facebook login application with the flutter's mobile application package's name
-type this command in the terminal keytool -exportcert -alias androiddebugkey -keystore "C:\Users\USERNAME\.android\debug.keystore" | "PATH_TO_OPENSSL_LIBRARY\bin\openssl" sha1 -binary | "PATH_TO_OPENSSL_LIBRARY\bin\openssl" base64
 to generate the Hash keys.
- download the dependency flutter_facebook_auth: ^4.3.0 from [](https://pub.dev/packages/flutter_facebook_auth)
-in the resssource folder android/app/src/main/res/values create a strings.xml file
- change the value of strings tags with your data from your Facbook login app
  

  <string name="app_name">app name</string>

  <string name="facebook_app_id">123456789</string>
  <string name="fb_login_protocol_scheme">fb123456789</string>
  <string name="facebook_client_token">facebook_client_token</string>

- add this line to the androidManifest.xml file in application tag <meta-data android:name="com.facebook.sdk.ApplicationId" android:value="@string/facebook_app_id"/>
        