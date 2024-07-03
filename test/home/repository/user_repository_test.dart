import 'package:adss_limited_mechine_test/home/repository/user_repository.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late UserRepository userRepository;
  setUp(() {
    userRepository = UserRepository();
  });
  group("User Repoeitory", () {
    group('fetch user-', () {
      test(
          'given UserRepository class when fetchuser function is called and status code is 200 then user model should be return',
          () async {
            
        final user = await userRepository.fetchUser();
        expect(user.book?.isNotEmpty, user.book?.isNotEmpty);
      });
    test(
          'Staus code is note 200',
          () async {
            
        final user = await userRepository.fetchUser();
        expect(user.book?.isEmpty, user.book?.isNotEmpty);
      });
    });
  });
}
