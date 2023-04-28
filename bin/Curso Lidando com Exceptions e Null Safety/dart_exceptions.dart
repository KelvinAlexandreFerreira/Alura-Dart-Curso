import 'dart:io';
import 'dart:math';

import 'controllers/bank_controller.dart';
import 'exceptions/bank_controller_exceptions.dart';
import 'models/account.dart';

void testingNullSafety(){
  Account? myAccount;

  //Simulando uma comunicação externa
  Random rng = Random();
  int randomNumber = rng.nextInt(10);
  if(randomNumber <= 5){
    myAccount = Account(name: "Kelvin", balance: 700, isAuthenticated: true);
  }

  print(myAccount.runtimeType);

  //Não funciona
  //print(myAccount.balance);

  //Conversão direta: Má prática
  //print(myAccount!.balance);

  //Funciona
  //if (myAccount !=null) {
  //  print(myAccount.balance);
  //}else{
  //  print("Conta Nula");
  //}

  //Mesmo If com operação ternária
  //print(myAccount !=null ? myAccount.balance : "Conta nula");

  //Funciona, só imprime o balance se não for null, se for null imprime "null"
  print(myAccount?.balance);
}

void main() {
  testingNullSafety();

  // Criando o banco
  BankController bankController = BankController();

  // Adicionando contas
  //Account accountTest = Account(name: "Kelvin", balance: -20, isAuthenticated: true);

  bankController.addAccount(
      id: "Ricarth",
      account:
          Account(name: "Ricarth Lima", balance: 400, isAuthenticated: false));

  bankController.addAccount(
      id: "Kako",
      account:
          Account(name: "Caio Couto", balance: 600, isAuthenticated: true));

  // Fazendo transferência
  try {
    bool result = bankController.makeTransfer(
      idSender: "Kako", idReceiver: "Ricarth", amount: 800);  
    
    if(result){
      print("Transação concluída com sucesso!");
    }
  } on SenderIdInvalidException catch (e) {
    print(e);
    print("o ID '${e.idSender}' do remetente não é um ID válido!");
  } on ReceiverIdInvalidException catch (e) {
    print(e);
    print("o ID '${e.idReceiver}' do destinatário não é um ID válido!");
  } on SenderNotAuthenticatedException catch (e) {
    print(e);
    print("O usuário Remetente de id '${e.idSender}' não está autenticado.");
  } on ReceiverNotAuthenticatedException catch (e) {
    print(e);
    print("O usuário Destinatário de id '${e.idReceiver}' não está autenticado.");
  } on SenderBalanceLowerThaAmountException catch (e) {
    print(e);
    print("O usuário Remetente de id '${e.idSender}' tentou enviar ${e.amount} sendo que na sua conta tem apenas ${e.senderBalance}.");
  } on Exception {
    print("Algo deu errado!");
  }
  
}