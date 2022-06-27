class Brain {
  String _value = '';

  void applyCommand(String command) {
    if (command == 'C') {
      _clear();
    } else {
      _value += command;
    }
  }

  _clear() {
    _value = '';
  }

  String get value {
    return _value;
  }
}
