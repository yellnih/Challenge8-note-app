import 'package:flutter/material.dart';
import '../models/note.dart';
import '../services/firestore_service.dart';

class NotesProvider with ChangeNotifier {
  final FirestoreService _firestoreService = FirestoreService();
  List<Note> _notes = [];
  bool _isLoading = false;
  String? _error;

  List<Note> get notes => _notes;
  bool get isLoading => _isLoading;
  String? get error => _error;

  // 메모 목록 불러오기
  void loadNotes(String userId) {
    _firestoreService.getNotes(userId).listen(
      (notes) {
        _notes = notes;
        _error = null;
        notifyListeners();
      },
      onError: (e) {
        _error = '메모를 불러오는데 실패했습니다.';
        notifyListeners();
      },
    );
  }

  // 메모 생성
  Future<void> createNote(String userId, String title, String content) async {
    try {
      _isLoading = true;
      notifyListeners();

      final note = Note(
        id: '',
        userId: userId,
        title: title,
        content: content,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );

      await _firestoreService.createNote(note);
      _error = null;
    } catch (e) {
      _error = '메모 생성에 실패했습니다.';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  // 메모 수정
  Future<void> updateNote(String id, {String? title, String? content}) async {
    try {
      _isLoading = true;
      notifyListeners();

      await _firestoreService.updateNote(id, title: title, content: content);
      _error = null;
    } catch (e) {
      _error = '메모 수정에 실패했습니다.';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  // 메모 삭제
  Future<void> deleteNote(String id) async {
    try {
      _isLoading = true;
      notifyListeners();

      await _firestoreService.deleteNote(id);
      _error = null;
    } catch (e) {
      _error = '메모 삭제에 실패했습니다.';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
