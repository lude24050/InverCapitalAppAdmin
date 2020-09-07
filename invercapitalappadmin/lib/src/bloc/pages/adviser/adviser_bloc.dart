import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:invercapitalappadmin/src/api/user_api.dart';
import 'package:invercapitalappadmin/src/models/user.dart';
import 'bloc.dart';

class AdviserBloc extends Bloc<AdviserEvents, AdviserState> {
  UserApi _partnerApi = UserApi.instance;

  AdviserBloc() {
    this._init();
  }

  @override
  Future<void> close() async {
    super.close();
  }

  _init() async {
    add(LoadListUser());
  }


  @override
  Stream<AdviserState> mapEventToState(AdviserEvents event) async* {
    if (event is LoadListUser) {
      List<User> data = [];
      data = await _partnerApi.getUser();
      print(data);
      yield AdviserState(user: data, loading: false);
    }
  }



  @override
  // TODO: implement initialState
  AdviserState get initialState => AdviserState.initialState;
}
