import 'package:socket_io_client/socket_io_client.dart' as IO;

void main() {
  // Dart クライアント
  IO.Socket socket = IO.io('http://localhost:8080', <String, dynamic>{
    'transports': ['websocket'],
    'autoConnect': false,
  });
  socket.connect();
  socket.onConnect((_) {
    print('connect');
    socket.emit('event', 'test message');
  });
  socket.on('event', (data) => print(data));
  socket.onDisconnect((_) => print('disconnect'));
  socket.on('fromServer', (data) => print('fromServer: $data'));
  print('Client is trying to connect to http://localhost:8080');
}