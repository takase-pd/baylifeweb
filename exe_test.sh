# get the latest FlutterFlow version
# git checkout flutterflow
# git fetch
# git checkout .
# git clean -df .
# git checkout main
# git merge origin/flutterflow

# Flutter compile
flutter pub get
flutter packages pub run build_runner build --delete-conflicting-outputs
flutter run -d chrome --web-port 5000 --web-renderer html