import 'dart:io';

class GroupQuestions {
  String oiGrupo = 'Oi, grupo!';
  String bomDiagrupo = 'Bom dia, grupo!';
  String bemEVc = 'Bem, e vc?';
  String question;
  bool isThisAGroupQuestion = false;
  String kelvinBot = 'KelvinBOT:\n';

  GroupQuestions({required this.question});

  bool isThisGroup() {
    if (question.toUpperCase().contains('GRUPO') || question.toUpperCase().contains('BOM DIA') ||
      question.toUpperCase().contains('BEM, E VC?') ) {
      isThisAGroupQuestion = true;
    }
    return isThisAGroupQuestion;
  }

  groupQuestion() {
    if (question == oiGrupo) {
      String _botAnswer = 'Oi! Tudo bem?';
      print(_botAnswer);
    } else if (question == bomDiagrupo) {
      String _botAnswer = 'Bom dia! Tudo bem?';
      print(_botAnswer);
    } else if (question == bemEVc) {
      String _botAnswer = 'Certinho';
      print(_botAnswer);
    } else {
      unsure();
    }
  }

  void unsure() {
    String _botQuestion =
        kelvinBot + ' Não entendi, você quer interagir com o nosso grupo?';
    print(_botQuestion);

    String answer = stdin.readLineSync().toString();

    if (answer.toUpperCase().contains('SIM')) {
      String _botAnswer = kelvinBot +
          ' Beleza, então seja muito bem vindo!';
      print(_botAnswer);
    } else {
      String _botAnswer = kelvinBot + ' Ah, foi mal... entendi errado.';
      print(_botAnswer);
    }
  }
}
