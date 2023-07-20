part of 'productbloc_bloc.dart';

abstract class ProductblocEvent extends Equatable {
  const ProductblocEvent();
  @override
  List<Object> get props => [];
}
 class ProductLoadedEvent extends Equatable{
  @override
  List<Object?> get props => [];
}