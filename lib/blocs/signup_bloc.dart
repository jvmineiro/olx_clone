import 'package:rxdart/rxdart.dart';
import 'package:xlo/models/user.dart';

enum SignUpState {IDLE, LOADING, ERROR }

class SignUpBlocState {

  SignUpBlocState(this.state, {this.errorMessage});

  SignUpState state;
  String errorMessage;
}

class SignUpBloc {

  final BehaviorSubject<SignUpBlocState> _stateController =
    BehaviorSubject<SignUpBlocState>.seeded(SignUpBlocState(SignUpState.IDLE));

  Stream<SignUpBlocState> get outState => _stateController.stream;

  User user = User();

  set name(String name) => user.name = name;

  void  dispose(){
    _stateController.close();
  }

}