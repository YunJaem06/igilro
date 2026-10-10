# 이길로 · igilro

사용자가 원하는 환경과 상황에 맞는 도보 경로를 찾는 Flutter 앱입니다. Mapbox는 지도를 렌더링하고, 별도의 Kotlin/Spring Boot 서버가 경로 추천과 환경 점수를 계산합니다.

현재 Phase 1: 앱 진입점, Riverpod DI, go_router, 테마, 환경 설정, Dio 통신·오류 경계, 코드 생성, 테스트와 CI를 구성했습니다. 기본 소개 화면이 표시되며 지도·위치·경로 API 연결은 다음 단계입니다.

## 개발 환경

- Flutter 3.47.7 stable / Dart 3.13.5로 검증
- 프로젝트 Dart 요구사항: ^3.13.4
- Android: Android SDK, JDK 21 사용 가능
- iOS: Xcode와 iOS Simulator

Xcode를 설치했지만 활성 개발자 경로가 CommandLineTools라면, iOS 명령을 실행할 터미널에서 다음 설정을 적용합니다.

```sh
export DEVELOPER_DIR=/Applications/Xcode.app/Contents/Developer
```

```sh
flutter pub get --enforce-lockfile
dart run build_runner build
flutter run
```

## 환경 설정

`APP_ENV`: development, staging, production. Debug/Profile의 기본값은 development이고, Release의 기본값은 production입니다.

`API_BASE_URL`: 서버 origin만 지정하며 포트는 1~65535 범위입니다. 경로·query·fragment·자격 증명을 포함하지 않습니다. 개발 환경에서 생략하면 http://localhost:8080을 사용합니다. staging/production은 명시적인 HTTPS 주소가 필요합니다. dart-define에는 앱에 포함되는 공개 설정만 넣습니다.

Android Emulator에서 개발 Mac의 서버를 사용할 때:

```sh
flutter run --dart-define=APP_ENV=development --dart-define=API_BASE_URL=http://10.0.2.2:8080
```

iOS Simulator에서:

```sh
flutter run --dart-define=APP_ENV=development --dart-define=API_BASE_URL=http://localhost:8080
```

실제 기기는 접근 가능한 개발 Mac의 네트워크 주소를 사용합니다. Phase 1은 API를 호출하지 않습니다. 로컬 HTTP의 플랫폼별 허용 범위·위치 권한과 실제 통신은 해당 기능을 추가하면서 검증합니다.

운영 빌드는 실제 서버 주소를 지정합니다. 아래 example 주소는 문법 설명용입니다.

```sh
flutter build appbundle --dart-define=APP_ENV=production --dart-define=API_BASE_URL=https://api.example.com
```

## 패키지 역할

| 패키지 | 역할 |
| --- | --- |
| flutter_riverpod / riverpod_annotation / riverpod_generator | 상태관리·DI와 Provider 코드 생성 |
| dio | JSON HTTP 요청, timeout과 취소 |
| go_router | 중앙 라우팅과 오류 경로 복구 |
| freezed / freezed_annotation | 불변 오류 값과 DTO 생성 |
| json_serializable / json_annotation | DTO JSON 변환 |
| build_runner | 코드 생성 실행 |
| flutter_localizations | 한국어 Material 기본 문구 지원 |

Mapbox와 위치 패키지는 Phase 2에서 추가합니다. Repository·UseCase·DTO/Entity/Mapper는 실제 기능 단위로 추가합니다.

## 검증

```sh
dart run build_runner build
dart format --output=none --set-exit-if-changed lib test
flutter analyze --no-pub
flutter test --no-pub --coverage
flutter build apk --debug --no-pub
flutter build ios --simulator --debug --no-pub
```

테스트는 실제 서버를 호출하지 않고 Fake HTTP adapter를 사용합니다. 생성 파일은 직접 수정하지 않고 소스와 함께 저장소에 포함합니다. GitHub Actions는 생성 파일 일치·포맷·분석·테스트·Android debug 빌드를 검사합니다.

- [아키텍처와 의존성 규칙](docs/architecture.md)
- [서버 Codex 전달 문서](docs/server_handoff.md)
