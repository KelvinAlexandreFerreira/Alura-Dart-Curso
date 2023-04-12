import 'dart:ffi';

void main() {
  String nome = "Laranja";
  double peso = 100.2;
  String cor = "Verde e Amarela";
  String sabor = "Doce e Cítrica";
  int diasDesdeColheita = 40;
  bool isMadura = funcEstaMaduro(diasDesdeColheita); 

  Fruta fruta01 = Fruta(nome, peso, cor, sabor, diasDesdeColheita);
  Fruta fruta02 = Fruta("uva", 40, "Roxa", "Doce", 20);

  fruta01.estaMadura(30);
  fruta02.estaMadura(60);

  Legumes mandioca = Legumes('Macaxeira', 1200, 'Marrom', true);
  Fruta banana = Fruta('Banana', 75, 'Amarela', 'Doce', 12);
  Nozes macadamia = Nozes('Macadâmia', 2, 'Branco Amarelado', 'Doce', 20, 35);
  Citricas limao = Citricas('Limão', 50, 'Verde', 'Azedo', 5, 9);

  mandioca.printAlimento();
  banana.printAlimento();
  mandioca.printAlimento();
  limao.printAlimento();

  mandioca.cozinhar();
  // limao.cozinhar(); //não funciona
  // mandioca.fazerSuco(); //não funciona
  limao.fazerSuco();

  
}

mostrarMadura(String nome, int dias, {String? cor}) {
  if (dias >= 30) {
    print("A $nome está madura.");
  } else {
    print("A $nome não está madura.");
  }

  if (cor != null) {
    print("A $nome é $cor");
  }
} 

int funcQuantosDiasMadura(int dias){
  int diasParaMadura = 30;
  int quantosDiasFaltam = diasParaMadura - dias;
  return quantosDiasFaltam;
}

bool funcEstaMaduro(int dias){
  if (dias >= 30) {
    return true;
  }else{
    return false;
  }  
}

funcRecursiva(int contador, int condicaoParada) {
  print("Estamos a $contador iterações sem StackOverflow.");
  if (contador >= condicaoParada) {
    return;
  }
  funcRecursiva(contador + 1, condicaoParada);
}

class Fruta extends Alimento{
  String sabor;
  int diasDesdeColheita;
  bool? isMadura;  

  Fruta(String nome, double peso, String cor, this.sabor, this.diasDesdeColheita, {this.isMadura})
    :super(nome, peso, cor);

  void estaMadura(int diasParaMadura){
    isMadura = diasDesdeColheita >= diasParaMadura;
    print("A sua $nome foi colhida a $diasDesdeColheita dias, e precisa de $diasParaMadura para poder comer. Ela está madura? $isMadura.");
  }

  void fazerSuco(){
    print('Você fez um ótimo suco de $nome.');
  }
}

class Alimento {
  String nome;
  double peso;
  String cor;
  Alimento(this.nome, this.peso, this.cor);

  void printAlimento(){
    print('Este(a) $nome pesa $peso gramas e é $cor.');
  }
}

class Legumes extends Alimento implements Bolo{
  bool isPrecisaCozinhar;  

  Legumes(String nome, double peso, String cor, this.isPrecisaCozinhar)
    : super(nome, peso, cor);

  void cozinhar(){
    if (isPrecisaCozinhar) {
      print('Pronto, o $nome está cozinhando!');
    }else{
      print('Nem precisa cozinhar!');
    }
  }
  
  @override
  void assar() {
    // TODO: implement assar
  }
  
  @override
  void fazerMassa() {
    // TODO: implement fazerMassa
  }
  
  @override
  void separarIngredientes() {
    // TODO: implement separarIngredientes
  }
}

class Citricas extends Fruta{
  double nivelAzedo;  

  Citricas(String nome, double peso, String cor, String sabor, int diasDesdeColheita, this.nivelAzedo)
    : super(nome, peso, cor, sabor, diasDesdeColheita);

  void existeRefri(bool existe){
    if (existe) {
      print('Existe Refrigerante de $nome.');
    }else{
      print('Não existe Refri de $nome.');
    }
  }
}

class Nozes extends Fruta{
  double porcentagemOleoNatural;  

  Nozes(String nome, double peso, String cor, String sabor, int diasDesdeColheita, this.porcentagemOleoNatural)
    : super(nome, peso, cor, sabor, diasDesdeColheita);  
}

abstract class Bolo{
  void separarIngredientes();
  void fazerMassa();
  void assar();
}