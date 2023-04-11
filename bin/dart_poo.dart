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

class Fruta {
  String nome;
  double peso;
  String cor;
  String sabor;
  int diasDesdeColheita;
  bool? isMadura;  

  Fruta(this.nome, this.peso, this.cor, this.sabor, this.diasDesdeColheita, {this.isMadura});

  estaMadura(int diasParaMadura){
    isMadura = diasDesdeColheita >= diasParaMadura;
    print("A sua $nome foi colhida a $diasDesdeColheita dias, e precisa de $diasParaMadura para poder comer. Ela está madura? $isMadura.");
  }
}

class Alimento {
  String nome;
  double peso;
  String cor;
  Alimento(this.nome, this.peso, this.cor);
}

class Legumes{
  String nome;
  double peso;
  String cor;
  bool isPrecisaCozinhar;  
  Legumes(this.nome, this.peso, this.cor, this.isPrecisaCozinhar);
}

class Citricas {
  String nome;
  double peso;
  String cor;
  int diasDesdeColheita;
  bool? isMadura;
  double nivelAzedo;  

  Citricas(this.nome, this.peso, this.cor, this.diasDesdeColheita, this.nivelAzedo);
}

class Nozes {
  String nome;
  double peso;
  String cor;
  int diasDesdeColheita;
  bool? isMadura;
  double porcentagemOleoNatural;  

  Nozes(this.nome, this.peso, this.cor, this.diasDesdeColheita, this.porcentagemOleoNatural);  
}