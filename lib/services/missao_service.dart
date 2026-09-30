import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/missao.dart';

class MissaoService {
  final CollectionReference _collection = FirebaseFirestore.instance.collection('missoes');

  // C - CREATE
  Future<void> adicionar(Missao missao) async {
    await _collection.add(missao.toMap());
  }

  // R - READ
  Future<List<Missao>> buscarTodas() async {
    QuerySnapshot snapshot = await _collection.get();
    return snapshot.docs.map((doc) {
      return Missao.fromMap(doc.data() as Map<String, dynamic>, doc.id);
    }).toList();
  }

  // U - UPDATE 
  Future<void> atualizar(Missao missao) async {
    if (missao.id != null) {
      await _collection.doc(missao.id).update(missao.toMap());
    }
  }

  // D - DELETE
  Future<void> excluir(String id) async {
    await _collection.doc(id).delete();
  }
}