import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:untitled3/bloc/productbloc_bloc.dart';

import '../Repository/user_repo.dart';
import '../models/usersModel.dart';

part 'users_state.dart';

class UsersCubit extends Cubit<UsersState> {
  final UserRepo userRepo;
  UsersCubit(this.userRepo) : super(UserLoadingState());

  onLoadProducts() async {
    try {
      emit(UserLoadingState());
      var data = await userRepo.getProducts();

      emit(UserLoadedState(data));
    }
    catch (e) {
     emit(UserErrorState(e.toString()));
    }
  }
}
