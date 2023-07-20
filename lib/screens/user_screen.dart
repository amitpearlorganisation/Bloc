import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled3/cubit/users_cubit.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({super.key});

  @override

  State<UserScreen> createState() => _UserScreenState();
}
bool isResponseSave = false;
class _UserScreenState extends State<UserScreen> {
  @override
  void initState() {
    if(!isResponseSave){
    context.read<UsersCubit>().onLoadProducts();
    isResponseSave = true;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("User Screen"),
        backgroundColor: Colors.green,
      ),
      body: BlocBuilder<UsersCubit, UsersState>(
        builder: (context, state) {
          if(state is UserLoadingState){
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if(state is UserLoadedState){
            return
              ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index){
                    return Card(
                      color: Colors.red,
                      elevation: 10,
                      child: ListTile(
                        leading: Text(state.usersModel[index].email.toString()),
                        subtitle: Text(state.usersModel[index].phone.toString()),

                      ),
                    );
                  });
          }
           else if ( state is UserErrorState){
            return Center(child: Text(state.errorMessage),);
          }
           return SizedBox();
        },
      ),
    );
  }
}
