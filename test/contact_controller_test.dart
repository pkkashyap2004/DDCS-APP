import 'package:ddcs_app/controllers/contact_controller.dart';
import 'package:ddcs_app/services/supabase_service.dart';
import 'package:flutter_test/flutter_test.dart';
void main(){group('ContactController validation',(){late ContactController controller;setUp(()=>controller=ContactController(SupabaseService()));test('rejects short names',(){expect(()=>controller.submit(name:'A',email:'a@example.com',phone:'',message:'This is a test message'),throwsArgumentError);});test('rejects invalid email',(){expect(()=>controller.submit(name:'Pradeep',email:'invalid',phone:'',message:'This is a test message'),throwsArgumentError);});test('rejects short messages',(){expect(()=>controller.submit(name:'Pradeep',email:'a@example.com',phone:'',message:'short'),throwsArgumentError);});});}
