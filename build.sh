if [[ "$OSTYPE" == "linux-gnu"* ]]; then
dart compile exe dart_ctags.dart -o dart_ctags
else
dart compile exe dart_ctags.dart
fi