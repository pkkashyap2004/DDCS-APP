import 'package:ddcs_app/models/contact_inquiry.dart';
import 'package:ddcs_app/models/customer_review.dart';
import 'package:ddcs_app/models/product.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseService {
  SupabaseClient? get _client => Supabase.instance.isInitialized ? Supabase.instance.client : null;
  Future<List<Product>> fetchProducts() async {
    final client = _client;
    if (client == null) return const [];
    final rows = await client.from('products').select('id,name,description,price,image_url').eq('is_published', true).order('created_at', ascending: false).limit(30);
    return (rows as List).map((row) => Product.fromMap(Map<String, dynamic>.from(row))).toList();
  }
  Future<List<CustomerReview>> fetchReviews() async {
    final client = _client;
    if (client == null) return const [];
    final rows = await client.from('reviews').select('display_name,message,rating').eq('is_published', true).order('created_at', ascending: false).limit(10);
    return (rows as List).map((row) => CustomerReview.fromMap(Map<String, dynamic>.from(row))).toList();
  }
  Future<void> submitInquiry(ContactInquiry inquiry) async {
    final client = _client;
    if (client == null) throw StateError('Supabase is not configured. Copy .env.example to .env and add project credentials.');
    await client.from('contact_inquiries').insert(inquiry.toInsertMap());
  }
}
