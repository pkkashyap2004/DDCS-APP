import 'package:ddcs_app/models/customer_review.dart';
import 'package:ddcs_app/models/product.dart';
import 'package:ddcs_app/services/supabase_service.dart';
class HomeController { HomeController(this._service); final SupabaseService _service; Future<List<Product>> loadProducts()=>_service.fetchProducts(); Future<List<CustomerReview>> loadReviews()=>_service.fetchReviews(); }
