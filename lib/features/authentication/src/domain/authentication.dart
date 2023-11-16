abstract class Authentication {
  currentUser();

  Future<void> verifyPhone(String number, Function(String, int?) codeSent);

  Future<void> signInWithPhoneBy(String verificationId, String smsCode);

  Future<void> logout();
}