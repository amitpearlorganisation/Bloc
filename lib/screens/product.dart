import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled3/bloc/productbloc_bloc.dart';
import 'package:untitled3/bloc/productbloc_bloc.dart';

class Product_scren extends StatefulWidget {
  const Product_scren({super.key});

  @override
  State<Product_scren> createState() => _Product_screnState();
}

bool isResponseSaved = false;

class _Product_screnState extends State<Product_scren> {
  @override
  void initState() {
    if (!isResponseSaved) {
      context.read<ProductblocBloc>().add(ProductLoadedEvent());
      isResponseSaved = true;
    }
    super.initState();
  }

  @override

    Widget build(BuildContext context) {
      return Scaffold(
          appBar: AppBar(
            title: Text("productScreen"),
          ),
          body:
          /* BlocListener<ProductblocBloc, ProductblocState>(listener: (context, state){
        if(state is ProductsLoadedState){
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text("Data Loaded")) );
        } else if (state is ProductsErrorState){
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text("Data not loaded")));
        }

      },
      child: const Center(
        child: Text("Bloc Listener",
        style: TextStyle(fontSize: 22),
        ),
      ),
      )*/

          BlocBuilder<ProductblocBloc, ProductblocState>(
            builder: (context, state) {
              if (state is ProductsLoadingState) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              else if (state is ProductsLoadedState) {
                return ListView.builder(
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return Card(
                        color: Colors.blueGrey,
                        elevation: 10,
                        child: ListTile(
                          leading: Text(state.productModel[index].category
                              .toString()),
                          subtitle: Text(state.productModel[index].price
                              .toString()),

                        ),
                      );
                    });
              }
              else if (state is ProductsErrorState) {
                return Center(child: Text(state.errorMessage),);
              }
              return const SizedBox();
            },
          )

      );
    }
  }
