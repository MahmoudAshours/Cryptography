import 'package:collection/collection.dart';

void main(List<String> arguments) {
  final _seedValue = '1001';
  var _state = LFSR(state: _seedValue.split(''));
  var _newState = <String>[];
  var output = [];
  while (!IterableEquality().equals(_newState, _seedValue.split(''))) {
    // Printing new state each iteration
    print(_newState);
    final _shifted = _state.shifter();
    output.add(_state.shifted);
    _newState = _state.xor(_shifted);
    _state = LFSR(state: _newState);
  }
  String outputString = output.reduce((value, element) => value + '' + element);
  final _randomValue = int.parse(outputString, radix: 2);
  print(_randomValue);
}

class LFSR {
  final List<String> state;
  LFSR({required this.state});

  String shifted = '';

  List<String> shifter() {
    shifted = state.last;
    state.removeLast();
    return state;
  }

  List<String> xor(List<String> newState) {
    var newValue = int.parse(shifted) ^ int.parse(newState.last);
    return [(newValue.toString()), ...newState];
  }
}
