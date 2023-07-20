part of 'users_cubit.dart';

abstract class UsersState extends Equatable{
  const UsersState();
  @override
  List<Object> get props => [];
}

class UsersInitial extends UsersState {}
class UserLoadingState extends UsersState {}
class UserLoadedState extends UsersState {
  final List<UsersModel> usersModel;

 const UserLoadedState(this.usersModel);

 @override
  List<Object> get props => [usersModel];
}
class UserErrorState extends UsersState {
  final String errorMessage;
  const UserErrorState(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];

}