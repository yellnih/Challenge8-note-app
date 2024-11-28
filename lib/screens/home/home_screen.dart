import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../models/note.dart';
import '../../providers/auth_provider.dart';
import '../../widgets/common/empty_state.dart';
import '../../widgets/shared/custom_app_bar.dart';
import '../../widgets/shared/bottom_nav_bar.dart';
import 'components/note_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    
    // 임시 데이터
    final notes = [
      Note(
        id: '1',
        userId: authProvider.user?.uid ?? '',
        title: '첫 번째 메모',
        content: '메모 내용입니다.',
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      ),
    ];

    return Scaffold(
      appBar: CustomAppBar(
        title: '노트',
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () => authProvider.signOut(),
          ),
        ],
      ),
      body: notes.isEmpty
          ? const EmptyState(
              message: '작성된 메모가 없습니다.',
              icon: Icons.note_outlined,
            )
          : ListView.builder(
              itemCount: notes.length,
              itemBuilder: (context, index) {
                return NoteCard(
                  note: notes[index],
                  onTap: () {
                    // TODO: 메모 상세 화면으로 이동
                  },
                );
              },
            ),
      bottomNavigationBar: BottomNavBar(
        currentIndex: 0,
        onTap: (index) {
          // TODO: 화면 전환 구현
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // TODO: 메모 작성 화면으로 이동
        },
        child: const Icon(Icons.add),
      ),
    );
  }
} 