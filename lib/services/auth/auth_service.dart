import 'package:to_do/providers/auth/auth_provider.dart';
import 'package:to_do/providers/auth/firebase_auth_provider.dart';
import 'package:to_do/services/auth/auth_user.dart';

class AuthService implements AuthProvider {
  final AuthProvider provider;
  AuthService(this.provider);

  factory AuthService.firebase() => AuthService(FirebaseAuthProvider());

  @override
  AuthUser? get currentUser => provider.currentUser;

  @override
  Future<void> initialize() => provider.initialize();

  @override
  Future<AuthUser> signIn({required String email, required String password}) =>
      provider.signIn(
        email: email,
        password: password,
      );

  @override
  Future<void> signOut() => provider.signOut();

  @override
  Future<AuthUser> signUp({required String email, required String password}) =>
      provider.signUp(
        email: email,
        password: password,
      );

  @override
  String? get uid => provider.uid;
}
