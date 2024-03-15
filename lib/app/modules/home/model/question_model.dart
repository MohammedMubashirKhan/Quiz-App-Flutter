class Question {
  final String? text;
  final List<Options>? options;
  final bool isLocked;
  final Options? selectedOption;

  Question({
    required this.text,
    required this.options,
    this.isLocked = false,
    this.selectedOption,
  });
}

class Options {
  String? text;
  bool? isCorrect;

  Options({
    required this.text,
    required this.isCorrect,
  });
}
