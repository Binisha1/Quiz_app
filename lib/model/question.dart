class Question{
  Question({required this.question,required this.answer});
  final String question;
  final List<String> answer;

  List<String> get shuffleAns{
    var ans = List.of(answer);
    ans.shuffle();
    return ans;
  }

}