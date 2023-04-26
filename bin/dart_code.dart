import 'transporte.dart';
import 'viagem.dart';

void main(List<String> args) { 
  Viagem viagemMaio = Viagem(locomocao: Transporte.aviao);
  print(viagemMaio.consultarTotalLocaisVisitados);
}