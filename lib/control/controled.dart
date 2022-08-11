import 'package:amplify_api/model_mutations.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:data_connected/util.dart';
import 'package:intl/intl.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/Merchant.dart';

abstract class StaffState {}

class LoaingStaff extends StaffState {}

class ListStaffs extends StaffState {
  final List<Merchant> staff;

  ListStaffs({required this.staff});
}

class ListFailure extends StaffState {
  final Exception exception;

  ListFailure({required this.exception});
}

class Controled extends Cubit<StaffState> {
  final toRepo = ToRepository();
  Controled() : super(LoaingStaff());

  void getStaffs() async {
    if (state is ListStaffs == false) {
      emit(LoaingStaff());
    }

    try {
      final data = await Amplify.DataStore.query(Merchant.classType);
      emit(ListStaffs(staff: data));
    } catch (e) {
      debug_print("error: $e");
    }
  }

  void createStaff(String username, String password, String permission) async {
    debug_print("---------username: $username");

    final current = DateFormat("yyyy-MM-dd").format(DateTime.now()).toString();

    final newStaff = Merchant(
      username: username,
      password: password,
      permission: permission,
      startTime: current,
    );

    try {
      await Amplify.DataStore.save(newStaff);
    } catch (e) {
      debug_print("error: $e");
    }
  }

  void observeStaff() {
    final obserS = toRepo.observeStaffs();
    obserS.listen((_) => getStaffs());
  }

  void updateNow(Merchant m, String u, String p, String per) async {
    await toRepo.updateData(m, u, p, per);
  }

  void deleteNow(Merchant m, String i) async {
    await toRepo.deleteTodoById(m, i);
  }
}

class ToRepository {
  Future<void> deleteTodoById(Merchant m, String i) async {
    final data = m.copyWith(id: i);

    try {
      await Amplify.DataStore.delete(data);
    } catch (e) {
      throw e;
    }
  }

  Future<void> updateData(Merchant m, String u, String p, String per) async {
    final current = DateFormat("yyyy-MM-dd").format(DateTime.now()).toString();

    final updatedStaff = m.copyWith(username: u, password: p, permission: per);

    try {
      await Amplify.DataStore.save(updatedStaff);
    } catch (e) {
      throw e;
    }
  }

  Future<List<Merchant>> getStaff() async {
    try {
      final data = await Amplify.DataStore.query(Merchant.classType);
      return data;
    } catch (e) {
      throw e;
    }
  }

  Stream observeStaffs() {
    return Amplify.DataStore.observe(Merchant.classType);
  }
}
