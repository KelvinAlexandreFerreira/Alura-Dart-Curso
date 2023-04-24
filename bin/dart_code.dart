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

  print(registrosVisitados);
  print(registrarPrecos);
  print(registrarPrecos["São Paulo"]);
  print(registrarPrecos["Tocantins"]);

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