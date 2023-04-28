import 'package:test/test.dart';

void main(){
  // Future myfuture = Future((){
  //   print('Going back to the future');
  //   return 22;
  // }).then((value) => print('The value is $value.'));

  //Future.delayed(Duration(seconds: 5));

  Future<int> myFutureFunc()async{
    print('I have a function in the future');
    await Future.delayed(Duration(seconds: 5));
    throw Exception();
    return 12;
  }

  // myFutureFunc()
  //   .then((value) => print('My function value is: $value'))
  //   .onError((error, stackTrace) => print('An error occurred'))
  //   .whenComplete(() => print('The future is Over.'));

  Future<int> myFutureErrorFunc(int a, int b) async{
    try {
      if (a > b) {
        throw Exception();
      }
      print('I have a functional Function');
      await Future.delayed(Duration(seconds: 5));
      return 42;
    } catch (e) {
      print('An error ocuured: $e');
      return 42;
    } finally {
      print('The future is finally over');
    }
  }

  myFutureErrorFunc(1, 2).then((value) => print('The value is $value'));

  print('Done with main');
}