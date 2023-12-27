import 'package:dayder/features/authentication/authentication.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';

import '../../../../features/authentication/src/domain/authentication.dart';

final _auth = GetIt.instance<Authentication>();

final userProvider = Provider<User?>((ref) => ref.watch(userStateProvider));

final userStateProvider = StateProvider<User?>((ref) => _auth.currentUser());
