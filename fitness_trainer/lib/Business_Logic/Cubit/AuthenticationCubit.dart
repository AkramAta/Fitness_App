import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';

// Authentication States
abstract class AuthenticationState {}

class AuthInitial extends AuthenticationState {}

class Authenticated extends AuthenticationState {
  final User user;
  Authenticated(this.user);
}

class Unauthenticated extends AuthenticationState {}

// Authentication Cubit
class AuthenticationCubit extends Cubit<AuthenticationState> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  AuthenticationCubit() : super(AuthInitial());

  void checkAuthStatus() {
    final user = _auth.currentUser;
    if (user != null) {
      emit(Authenticated(user));
    } else {
      emit(Unauthenticated());
    }
  }

  Future<void> signIn(String email, String password) async {
    try {
      UserCredential userCredential =
          await _auth.signInWithEmailAndPassword(email: email, password: password);
      emit(Authenticated(userCredential.user!));
    } catch (e) {
      emit(Unauthenticated());
    }
  }

  void signOut() async {
    await _auth.signOut();
    emit(Unauthenticated());
  }
}
