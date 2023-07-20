import 'package:http/http.dart' as http;
import 'package:untitled3/models/product_models.dart';
class ProductsRepo{

 Future<List<ProductModels>> getProducts() async{
    var response = await http.get(Uri.parse("https://fakestoreapi.com/products"));
    if (response.statusCode==200){
      return productModelsFromJson(response.body);
    }
    else {
      throw Exception("Failed to load products");
    }
  }


}