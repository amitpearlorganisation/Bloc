part of 'productbloc_bloc.dart';

abstract class ProductblocState extends Equatable {
  const ProductblocState();
  @override
  List<Object> get props => [];
}

class ProductsInitial extends ProductblocState {}
class ProductsLoadingState extends ProductblocState {}
class ProductsLoadedState extends ProductblocState{
  final List<ProductModels>  productModel;

  ProductsLoadedState(this.productModel);
  @override
  List<Object> get props => [productModel];
}
class ProductsErrorState extends ProductblocState{
  final String errorMessage;

  const ProductsErrorState(this.errorMessage);
}