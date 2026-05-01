import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

final internetStatusProvider = StreamProvider<InternetStatus>((ref) {
  return InternetConnection.createInstance(
    checkInterval: const Duration(seconds: 5),
  ).onStatusChange;
});

// class ConnectivityService {
//   final Connectivity _connectivity = Connectivity();
//   StreamSubscription<List<ConnectivityResult>>? _subscription;
//   Stream<List<ConnectivityResult>> get subscription => _connectivity.onConnectivityChanged;
//
//   void statListening() {
//     _subscription = _connectivity.onConnectivityChanged.listen((result) async {
//       if (result.contains(ConnectivityResult.none)) {
//         internetConnectivityMsg();
//       }
//     });
//   }
//
//   Future<bool> isInternetConnected() async {
//     try {
//       final result = await InternetAddress.lookup('google.com');
//       return result.isNotEmpty && result[0].rawAddress.isNotEmpty;
//     } on SocketException catch (e) {
//       return false;
//     }
//   }
//
//   void stopListening() {
//     _subscription?.cancel();
//   }
// }
