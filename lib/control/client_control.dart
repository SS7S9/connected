import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:data_connected/models/ModelProvider.dart';
import 'package:data_connected/util.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class ClientState {}

class LoaingClient extends ClientState {}

class ListClient extends ClientState {
  final List<Client> acount;

  ListClient({required this.acount});
}

class ListFailure extends ClientState {
  final Exception exception;

  ListFailure({required this.exception});
}

class ClientControl extends Cubit<ClientState> {
  final toRepo = ToRepository();
  ClientControl() : super(LoaingClient());

  void getStaffs() async {
    if (state is ListClient == false) {
      emit(LoaingClient());
    }

    try {
      final data = await Amplify.DataStore.query(Client.classType);
      emit(ListClient(acount: data));

      debug_print("client: $data");
    } catch (e) {
      debug_print("error: $e");
    }
  }

  void observeStaff() {
    final obserS = toRepo.observeStaffs();
    obserS.listen((_) => getStaffs());
  }

  void deleteNow(Client m, String i) async {
    await toRepo.deleteTodoById(m, i);
  }
}

class ToRepository {
  Future<void> deleteTodoById(Client m, String i) async {
    final data = m.copyWith(id: i);

    try {
      await Amplify.DataStore.delete(data);
    } catch (e) {
      throw e;
    }
  }

  Future<List<Client>> getStaff() async {
    try {
      final data = await Amplify.DataStore.query(Client.classType);
      return data;
    } catch (e) {
      throw e;
    }
  }

  Stream observeStaffs() {
    return Amplify.DataStore.observe(Client.classType);
  }
}
