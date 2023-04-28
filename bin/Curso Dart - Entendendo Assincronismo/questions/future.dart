import 'package:test/test.dart';

void main(){
  Future myfuture = Future((){
    print('Going back to the future');
    return 22;
  }).then((value) => print('The value is $value.'));

  Future.delayed(Duration(seconds: 5));

  Future<int> myFutureFunc()async{
    print('I have a function in the future');
    await Future.delayed(Duration(seconds: 5));
    return 12;
  }

  myFutureFunc().then((value) => print('My function value is: $value'));

  print('Done with main');
}