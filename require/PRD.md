#Project overview 
 1.'노션' 스타일의 앱
 2. 홈, 검색, 작성 탭으로 구성

# Core functionalities (핵심 기능)
 1. 홈 : 내가 작성한 메모들을 정렬하고 볼 수 있는 탭, 홈 화면에서도 메모를 보며 수정이 가능해야 함.
 2. 검색 : 메모 내용을 검색해서 찾을 수 있는 섹션
 3. 메모 작성 및 업로드/수정 가능 : 새로운 메모를 작성하는 섹션
 4. 소셜 로그인 기능
 5. 이미지, 영상 등을 업로드하는 기능(마지막에 수행)
 
# Doc (참고 문서)

## 1. 기술 스택
- Framework: Flutter
- 상태 관리: Provider
- 데이터베이스: Firebase Cloud Firestore
- 인증: Firebase Authentication
- 저장소: Firebase Storage (이미지, 영상 저장용)

## 2. 주요 패키지
- `provider`: ^6.0.0 (상태 관리)
- `firebase_core`: ^2.24.0 (Firebase 초기화)
- `firebase_auth`: ^4.15.0 (인증)
- `google_sign_in`: ^6.1.6 (구글 로그인)
- `cloud_firestore`: ^4.13.0 (데이터베이스)
- `firebase_storage`: ^11.5.0 (파일 저장)
- `image_picker`: ^1.0.4 (이미지 선택)
- `file_picker`: ^6.1.1 (파일 선택)
- `flutter_quill`: ^8.6.4 (리치 텍스트 에디터)

## 3. 주요 컴포넌트 설명

### 화면 (Screens)
- **HomeScreen**: 메모 목록 표시 및 정렬 기능
- **SearchScreen**: 메모 검색 기능
- **EditorScreen**: 메모 작성 및 편집
- **LoginScreen**: 소셜 로그인

### 모델 (Models)
- **Note**: 메모 데이터 모델
- **User**: 사용자 정보
- **MediaFile**: 미디어 파일 정보

### 프로바이더 (Providers)
- **AuthProvider**: 인증 상태 관리
- **NotesProvider**: 메모 데이터 관리
- **ThemeProvider**: 테마 상태 관리

### 서비스 (Services)
- **AuthService**: Firebase 인증 처리
- **StorageService**: 파일 업로드/다운로드
- **FirestoreService**: 데이터베이스 작업
- **MediaService**: 미디어 파일 처리

## 4. 구현 우선순위
1. 기본 UI 구조 및 네비게이션
2. 소셜 로그인 기능
3. 메모 CRUD 기능
4. 검색 기능
5. 미디어 파일 업로드 기능

## 5. 디자인 가이드라인
- 노션과 유사한 미니멀한 디자인
- 직관적인 사용자 경험
- 반응형 레이아웃
- 다크/라이트 모드 지원

## 6. 파일 구조
require/PRD.md
lib/
├── main.dart
├── config/
│ ├── theme.dart
│ └── routes.dart
├── models/
│ ├── note.dart
│ ├── user.dart
│ └── media_file.dart
├── providers/
│ ├── auth_provider.dart
│ ├── notes_provider.dart
│ └── theme_provider.dart
├── screens/
│ ├── auth/
│ │ ├── login_screen.dart
│ │ └── profile_screen.dart
│ ├── home/
│ │ ├── home_screen.dart
│ │ └── components/
│ │ ├── note_card.dart
│ │ └── sort_filter_bar.dart
│ ├── search/
│ │ ├── search_screen.dart
│ │ └── components/
│ │ ├── search_bar.dart
│ │ └── search_results.dart
│ └── editor/
│ ├── editor_screen.dart
│ └── components/
│ ├── toolbar.dart
│ └── media_picker.dart
├── services/
│ ├── auth_service.dart
│ ├── storage_service.dart
│ ├── firestore_service.dart
│ └── media_service.dart
├── utils/
│ ├── constants.dart
│ ├── validators.dart
│ └── helpers.dart
└── widgets/
├── common/
│ ├── loading_indicator.dart
│ ├── error_view.dart
│ └── empty_state.dart
└── shared/
├── custom_app_bar.dart
└── bottom_nav_bar.dart

# 작업 체크리스트

## 1단계: 프로젝트 초기 설정
- [x] 프로젝트 구조 설정
- [-] Firebase 프로젝트 생성 및 설정
  - [x] Firebase 콘솔에서 프로젝트 생성
  - [x] Android 앱 등록
  - [-] 구성 파일 다운로드 및 적용
    - [x] google-services.json 추가
    - [x] firebase_options.dart 설정
    - [ ] 패키지 의존성 문제 해결 필요
- [x] 필요한 패키지 추가 (pubspec.yaml 수정)

## 2단계: 기본 UI 구조 및 네비게이션
- [-] 기본 테마 설정
- [-] 라우팅 설정
- [-] 바텀 네비게이션 바 구현
- [-] 공통 위젯 구현
  - [ ] 커스텀 앱바
  - [ ] 로딩 인디케이터
  - [ ] 에러 뷰
  - [ ] 빈 상태 뷰

## 3단계: 인증 기능
- [-] Firebase Auth 설정
  - [x] 기본 설정 완료
  - [ ] Google 로그인 활성화 필요
- [-] 구글 로그인 구현
  - [x] 코드 작성
  - [ ] 패키지 의존성 해결 필요
- [x] AuthProvider 구현
- [x] 로그인 화면 구현
- [ ] 프로필 화면 구현

## 4단계: 메모 CRUD 기능
- [ ] Firestore 데이터 모델 설계
- [ ] Note 모델 구현
- [ ] NotesProvider 구현
- [ ] FirestoreService 구현
- [ ] 메모 작성 화면 구현
- [ ] 메모 목록 화면 구현
- [ ] 메모 수정 기능 구현
- [ ] 메모 삭제 기능 구현

## 5단계: 검색 기능
- [ ] 검색 화면 UI 구현
- [ ] Firestore 쿼리 구현
- [ ] 실시간 검색 기능 구현
- [ ] 검색 결과 표시 구현

## 6단계: 미디어 파일 업로드
- [ ] Firebase Storage 설정
- [ ] MediaService 구현
- [ ] 이미지 선택 및 업로드 기능 구현
- [ ] 비디오 선택 및 업로드 기능 구현
- [ ] 미디어 파일 표시 기능 구현

## 7단계: 최적화 및 테스트
- [ ] 성능 최적화
- [ ] 에러 처리 보완
- [ ] UI/UX 개선
- [ ] 테스트 작성 및 실행

## 8단계: 배포 준비
- [ ] 앱 아이콘 설정
- [ ] 스플래시 스크린 구현
- [ ] 빌드 설정 확인
- [ ] 릴리즈 버전 테스트

