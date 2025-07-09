// FUTURE
void main() async {
  final dataFromServer = await getUserNameFromServer();

  print(dataFromServer);
}

Future<String> getUserNameFromServer() async {
  // 1
  // final result = await Future.delayed(
  //   Duration(seconds: 2),
  //   () => 'Renat Bakaiev',
  // );
  // 2 USE THEN - when send something to server and dont want to wait
  final result = await Future.delayed(
    Duration(seconds: 2),
  ).then((value) => 'Renat Bakaiev');
  return result;
}
