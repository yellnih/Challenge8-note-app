## Firebase 설정 체크리스트

### 1. Firebase 프로젝트 생성
- [ ] Firebase 콘솔(console.firebase.google.com)에서 새 프로젝트 생성
- [ ] 프로젝트 이름: "challenge8-note-app"
- [ ] Google Analytics 설정

### 2. Android 앱 설정
- [ ] 패키지 이름으로 앱 등록: "com.example.challenge8"
- [ ] google-services.json 다운로드
- [ ] google-services.json 파일을 android/app/ 디렉토리에 추가
- [ ] android/build.gradle 수정  ```gradle
  buildscript {
    dependencies {
      classpath 'com.google.gms:google-services:4.4.0'
    }
  }  ```
- [ ] android/app/build.gradle 수정  ```gradle
  apply plugin: 'com.google.gms.google-services'  ```

### 3. iOS 앱 설정
- [ ] Bundle ID로 앱 등록: "com.example.challenge8"
- [ ] GoogleService-Info.plist 다운로드
- [ ] Xcode로 Runner.xcworkspace 열기
- [ ] GoogleService-Info.plist를 Runner/Runner 폴더에 추가
- [ ] iOS 최소 버전 12.0으로 설정

### 4. Firebase 서비스 활성화
- [ ] Authentication
  - [ ] Google 로그인 활성화
  - [ ] OAuth 동의 화면 설정
  - [ ] SHA-1, SHA-256 인증서 지문 추가
- [ ] Cloud Firestore
  - [ ] 데이터베이스 생성
  - [ ] 보안 규칙 설정  ```rules
  rules_version = '2';
  service cloud.firestore {
    match /databases/{database}/documents {
      match /users/{userId} {
        allow read, write: if request.auth != null && request.auth.uid == userId;
      }
      match /notes/{noteId} {
        allow read, write: if request.auth != null && 
          request.auth.uid == resource.data.userId;
      }
    }
  }  ```
- [ ] Storage
  - [ ] 스토리지 생성
  - [ ] 보안 규칙 설정  ```rules
  rules_version = '2';
  service firebase.storage {
    match /b/{bucket}/o {
      match /users/{userId}/{allPaths=**} {
        allow read, write: if request.auth != null && 
          request.auth.uid == userId;
      }
    }
  }  ```

### 5. 플러터 초기화 설정
- [ ] main.dart에 Firebase 초기화 코드 추가  ```dart
  void main() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    runApp(const MyApp());
  }  ```

### 6. 환경별 설정
- [ ] 개발환경 Firebase 프로젝트
- [ ] 프로덕션환경 Firebase 프로젝트
- [ ] 환경별 구성 파일 분리