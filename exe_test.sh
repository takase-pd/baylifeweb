# get the latest FlutterFlow version
# git checkout flutterflow
# git fetch
# git checkout .
# git clean -df .
# git checkout main
# git merge origin/flutterflow

# Flutter compile
rm -f ios/Podfile.lock
fvm flutter pub upgrade
fvm flutter packages pub run build_runner build --delete-conflicting-outputs
# fvm flutter run -d chrome --web-port 5000 --web-renderer html --release
fvm flutter run