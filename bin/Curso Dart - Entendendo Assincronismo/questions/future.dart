import 'package:test/test.dart';

void main(){
  Future myfuture = Future((){
    print('Going back to the future');
    return 22;
  }).then((value) => print('The value is $value.'));

  print('Done with main');
}