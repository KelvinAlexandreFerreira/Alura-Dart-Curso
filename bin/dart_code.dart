void main(List<String> args) {
  escolherMeioTransporte(Transporte.carro); 

  Set<String> registrosVisitados = <String>{};
  registrosVisitados = registrarDestinos("Rio de Janeiro", registrosVisitados);

  Map<String,dynamic> registrarPrecos = {};

  registrarPrecos["São Paulo"] = 1200;
  registrarPrecos["Rio de Janeiro"] = 1500;
  registrarPrecos["São Paulo"] = 1900;
  registrarPrecos["Nova Iorque"] = "Muito Caro!";

  registrarPrecos.remove("Rio de Janeiro");

  //print(registrosVisitados);
  //print(registrarPrecos);
  //print(registrarPrecos["São Paulo"]);
  //print(registrarPrecos["Tocantins"]);

  Pessoa pesssoa1 = Pessoa("Marcos", 22, true);
  //print(pesssoa1.toMap());

  dynamic meuNumero = 7.1;
  print(meuNumero.runtimeType);
  meuNumero= "STRING QUALQUER";
  print(meuNumero.runtimeType);

}

class Pessoa {
  String nome;
  int idade;
  bool estaAutenticada;

  Pessoa(this.nome, this.idade, this.estaAutenticada);

  Map<String, dynamic> toMap(){
    Map<String, dynamic> resultado = {};
    resultado["nome"] = this.nome;
    resultado["idade"] = this.idade;
    resultado["estaAutenticada"] = this.estaAutenticada;
    return resultado;
  }
}

Set<String> registrarDestinos(String destino, Set<String> banco){
  banco.add(destino);
  return banco;
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
      print("Vou de BUSÃO para aventura!");  
      break;
    default:
      print("Estou indo para aventura, isso é o que importa!");
      break;
  }
}

enum Transporte{
  carro,
  bike,
  andando,
  skate,
  aviao,
  patins,
  trem,
  onibus
}