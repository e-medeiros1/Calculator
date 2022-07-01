class Brain {
  //÷ & ⌫
  static const operations = ['%', '÷', 'x', '-', '+', '='];
  String? _operation;

  String _value = '0';
  final _buffer = [0.0, 0.0];
  int _bufferIndex = 0;
  bool _cleanValue = false;
  String _lastCommand = '';
  final _history = [0.0, 0.0];
  String _result = '';

  void applyCommand(String command) {
    //In case C, calls clear method
    if (_isReplacingOperation(command)) {
      _operation = command;
      return;
    }
    if (command == 'C') {
      _clear();
      //In case any operations string, call _setOperation
    } else if (operations.contains(command)) {
      _setOperation(command);
    } else {
      _addDigit(command);
    }

    _lastCommand = command;
  }

  _isReplacingOperation(String command) {
    return operations.contains(_lastCommand) &&
        operations.contains(command) &&
        _lastCommand != '=' &&
        command != '=';
  }

  _setOperation(String newOperation) {
    bool isEqualSign = newOperation == '=';
    if (_bufferIndex == 0) {
      if (!isEqualSign) {
        _operation = newOperation;
        _bufferIndex = 1;
        _cleanValue = true;
      }
    } else {
      _buffer[0] = _calculate();

      _buffer[1] = 0.0;

      _value = _buffer[0].toString();

      //Tirando o .0 de um valor inteiro sem toStringAsFixed
      _value = _value.endsWith('.0') ? _value.split('.')[0] : _value;

      _operation = isEqualSign ? '' : newOperation;
      _bufferIndex = isEqualSign ? 0 : 1;
    }
    _cleanValue = true;
  }

  //Add digit
  _addDigit(String digit) {
    final isDot = digit == '.';
    final cleanValue = (_value == '0' && !isDot) || _cleanValue;

    //Not allow user to add double point
    if (isDot && _value.contains('.') && !cleanValue) {
      return;
    }

    final emptyValue = isDot ? '0' : '';
    final currentValue = cleanValue ? emptyValue : _value;

    _value = currentValue + digit;
    _cleanValue = false;

    _buffer[_bufferIndex] = double.tryParse(_value) ?? 0;
    // print(_buffer);
  }

  //Limpa _value
  _clear() {
    _value = '0';
    _buffer.setAll(0, [0.0, 0.0]);
    _bufferIndex = 0;
    _operation = null;
    _cleanValue = false;
  }

  //Calculator method
  _calculate() {
    switch (_operation) {
      case '%':
        return _buffer[0] % _buffer[1];
      case '÷':
        return _buffer[0] / _buffer[1];
      case 'x':
        return _buffer[0] * _buffer[1];
      case '+':
        return _buffer[0] + _buffer[1];
      case '-':
        return _buffer[0] - _buffer[1];

      default:
        return _buffer[0];
    }
  }

  String showHistory() {
    // result = '${_history[0].toString()} $_operation ${_history[1].toString()}';

    _history[0] = _buffer[0];
    _history[1] = _buffer[1];

    if (_buffer[0] != 0 && _operation == null && _buffer[1] == 0) {
      //1
      return _history[0].toStringAsFixed(0);
    } else if (_buffer[0] != 0 && _operation != null && _buffer[1] == 0) {
      //1 +
      return '${_history[0].toStringAsFixed(0)} $_operation';
    } else if (_buffer[0] != 0 && _operation != null && _buffer[1] != 0) {
      //1+1

      return '${_history[0].toStringAsFixed(0)} $_operation ${_history[1].toStringAsFixed(0)}';
    }

    return '';
  }

  String get value {
    return _value;
  }
}
