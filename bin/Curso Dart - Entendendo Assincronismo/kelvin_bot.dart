
import 'dart:io';

import 'questions/good_manners.dart';
import 'questions/group_questions.dart';
import 'questions/time_questions.dart';
import 'timing/waiting_time.dart';

void main() async {
  String kelvinBot = 'KelvinBOT:\n';
  var a = true;
  String usuario = '';

  var myStream = BotClock.kelvinBotStream(1, 10);
  var subscriber = myStream.listen((event) {
    print('                KelvinBot está ativo a $event segundos');
  }, onDone: () {
    print('KelvinBot está sendo finalizado, faça a última pergunta!');
    a = false;
  });

  print('-- Iniciando o KelvinBOT, aguarde..--');
  await BotClock().clock(2);

  print('KelvinBOT:\n Oi :) \n Como posso ajudar?');
  do {
    usuario = stdin.readLineSync().toString();
    print('-- Processando pergunta, aguarde..--');
    await BotClock().clock(1);
    if (usuario.contains('xau') ||
        usuario.contains('Xau') ||
        usuario.contains('Adeus') ||
        usuario.contains('adeus')) {
      a = false;
      print(kelvinBot + ' Até a proxima!!');
    } else if (TimeQuestions(usuario).isThisTime()) {
      // verificar antes, assim não fazemos toda a função sem precisar.
      await BotClock().clock(2);
      TimeQuestions(usuario).timeQuestion();
    } else if (GroupQuestions(question: usuario).isThisGroup()) {
      await BotClock().clock(2);
      GroupQuestions(question: usuario).groupQuestion();
    } else if (GoodManners(usuario).isThisManners()) {
      await BotClock().clock(2);
      GoodManners(usuario).goodManners();
    } else {
      await BotClock().clock(2);
      print(kelvinBot +
          ' Não fui treinado para responder a essa pergunta \n Desculpe :( ');
      print(kelvinBot + ' Você pode fazer outra pergunta ou dizer Adeus');
    }
  } while (a);

  print('--Encerrando KelvinBOT--');
}
