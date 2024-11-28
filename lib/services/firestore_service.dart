import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/note.dart';

class FirestoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // 메모 생성
  Future<String> createNote(Note note) async {
    final docRef = await _firestore.collection('notes').add({
      'userId': note.userId,
      'title': note.title,
      'content': note.content,
      'createdAt': FieldValue.serverTimestamp(),
      'updatedAt': FieldValue.serverTimestamp(),
    });
    return docRef.id;
  }

  // 메모 목록 가져오기
  Stream<List<Note>> getNotes(String userId) {
    return _firestore
        .collection('notes')
        .where('userId', isEqualTo: userId)
        .orderBy('updatedAt', descending: true)
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) {
        final data = doc.data();
        return Note(
          id: doc.id,
          userId: data['userId'],
          title: data['title'],
          content: data['content'],
          createdAt: (data['createdAt'] as Timestamp).toDate(),
          updatedAt: (data['updatedAt'] as Timestamp).toDate(),
        );
      }).toList();
    });
  }

  // 메모 수정
  Future<void> updateNote(String id, {String? title, String? content}) async {
    await _firestore.collection('notes').doc(id).update({
      if (title != null) 'title': title,
      if (content != null) 'content': content,
      'updatedAt': FieldValue.serverTimestamp(),
    });
  }

  // 메모 삭제
  Future<void> deleteNote(String id) async {
    await _firestore.collection('notes').doc(id).delete();
  }
}
