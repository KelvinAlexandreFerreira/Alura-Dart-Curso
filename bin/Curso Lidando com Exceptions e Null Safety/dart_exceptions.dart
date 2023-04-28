import 'dart:io';

import 'controllers/bank_controller.dart';
import 'exceptions/bank_controller_exceptions.dart';
import 'models/account.dart';

void main() {
  //print("MysTring".runtimeType);
  //print(null.runtimeType);
  //Null;

  String naoPodeSerNula = "MyString";
  //naoPodeSerNula = null;

  String? podeSerNula = "MyString";
  print(podeSerNula.runtimeType);
  podeSerNula = null;
  print(podeSerNula.runtimeType);

  Account? myNullAccount;

  print(myNullAccount.balance);

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