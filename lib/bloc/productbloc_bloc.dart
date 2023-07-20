import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../Repository/produt_repo.dart';
import '../models/product_models.dart';
import "package:http/http.dart" as http;

part 'productbloc_event.dart';
part 'productbloc_state.dart';

class ProductblocBloc extends Bloc<ProductLoadedEvent, ProductblocState> {
 final ProductsRepo productsRepo;
  ProductblocBloc(this.productsRepo) : super(ProductsLoadingState()) {
    on<ProductLoadedEvent>((event, emit) async {
      final dio = Dio();
      try{
        emit(ProductsLoadingState());
        final data = await productsRepo.getProducts();
        emit(ProductsLoadedState(data));


        
      }
      catch (e){
        emit(ProductsErrorState(e.toString()));

      }

    });
  }
}
