# get the latest FlutterFlow version
git checkout flutterflow
git fetch
git checkout .
git clean -df .
git checkout main
git merge origin/flutterflow

# 
flutter pub get
flutter packages pub run build_runner build --delete-conflicting-outputs
