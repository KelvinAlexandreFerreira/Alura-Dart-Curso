import 'dart:ffi';

import 'transporte.dart';

class Viagem{
  static String codigoTrabalho = "DJNADS12";
  double dinheiro = 0;
  Transporte locomocao;
  Set<String> registrosVisitados = <String>{};
  Map<String,dynamic> registrarPrecos = {};

  int _totalLocaisVisitados = 0;

  Viagem({required this.locomocao});

  printCodigo(){
    print(codigoTrabalho);
  }

  void escolherMeioTransporte(Transporte locomocao){
    switch(locomocao){
      case Transporte.carro: 
        print("Vou de CARRO para aventura!");
        break;
      case Transporte.bike:
        print("Vou de BIKE para aventura!");  
        break;
      case Transporte.onibus:
        print("Vou de BUSÃO para aventura!");  
        break;
      default:
        print("Estou indo para aventura, isso Ã© o que importa!");
        break;
    }
  }

  void visitar(String localVisita){
    registrosVisitados.add(localVisita);
    _totalLocaisVisitados += 1;
  }

  void registrarPrecoVisita(String local, dynamic preco){
    registrarPrecos[local] = preco;
  }

  int get consultarTotalLocaisVisitados{
    return _totalLocaisVisitados;
  }

  void set alterarLocaisVisitados(int novaQnd){
    if (novaQnd < 10) {
      _totalLocaisVisitados = novaQnd;  
    }else{
      print("Não é possível!");
    } 
  }
}



