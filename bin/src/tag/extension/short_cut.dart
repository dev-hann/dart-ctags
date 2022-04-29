part of tag;

const Map<String, String> _shortCutMap = {
  'StatefulWidget': 'stfWidget',
  'StatelessWidget': 'stlWidget',
};

extension StringShortCuut on String {
  String toShortCut() {
    return _shortCutMap[this] ?? this;
  }
}
