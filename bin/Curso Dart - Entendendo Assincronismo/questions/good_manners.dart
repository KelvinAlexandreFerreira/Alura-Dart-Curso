class GoodManners {
  String question;
  bool isThisGoodManners = false;
  String kelvinBot = 'KelvinBOT:\n';

  GoodManners(this.question);

  bool isThisManners() {
    if (question.contains('Oi') ||
        question.contains('ola') ||
        question.contains('Oi') ||
        question.contains('Ola') ||
        question.contains('obrigado') ||
        question.contains('obrigada') ||
        question.contains('Obrigado') ||
        question.contains('Obrigada') ||
        question.contains('bom') ||
        question.contains('boa') ||
        question.contains('tarde') ||
        question.contains('noite') ||
        question.contains('de nada') ||
        question.contains('De nada')) {
          isThisGoodManners = true;
        }
    return isThisGoodManners;
  }

  goodManners(){
    if (question.contains('Bom dia') || question.contains('bom dia')) {
      print(kelvinBot + ' Bom dia Flor do dia!');
    } else if (question.contains('Boa tarde') || question.contains('boa tarde'))  {
      print(kelvinBot + ' Opa sô, boa tarde!');
    } else if (question.contains('Boa noite') || question.contains('boa noite'))  {
      print(kelvinBot + ' Uma bela noite, não é mesmo?');
    } else if (question.contains('oi') || question.contains('Oi') || question.contains('Ola'))  {
      print(kelvinBot + ' Muito prazer!');
    } else if (question.contains('Obrigado') || question.contains('obrigado') || question.contains('Obrigada') || question.contains('obrigada'))  {
      print(kelvinBot + ' De nada, fique a vontade c:');
    }
  }
}
