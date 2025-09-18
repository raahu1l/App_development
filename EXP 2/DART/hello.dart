import 'dart:io';

void main() {
  stdout.write('Enter a word: ');
  String? input = stdin.readLineSync();

  if (input != null && input.isNotEmpty) {
    print('Characters in the word:');
    int index = 0;

    // While loop to print each character
    while (index < input.length) {
      print(input[index]);
      index++;
    }
  } else {
    print('No input provided.');
  }
}
