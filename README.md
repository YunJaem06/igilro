# 이길로 · igilro

사용자가 원하는 환경과 상황에 맞는 도보 경로를 찾는 Flutter 앱입니다. Mapbox는 지도를 렌더링하고, 별도의 Kotlin/Spring Boot 서버가 경로 추천과 환경 점수를 계산합니다.

현재 Phase 3의 위치 선택과 기본 도보 경로 API 호출을 연결했습니다. Mapbox 지도·한국어 라벨·현재 위치 기능에 출발지/도착지 지도 선택, 핀 표시, 교환·삭제 기능을 제공합니다. 경로 검색 버튼은 선택한 좌표로 서버의 walking/fastest API를 호출하고 시간·거리·스냅된 보행로 끝점·접근 거리·출처와 지도 경로선을 표시합니다. 검색 성공 시 우회 구간을 포함한 전체 경로와 선택한 핀이 보이도록 카메라를 조정합니다. 장소명 검색은 이후 작업입니다.

## 개발 환경

- 기존 macOS 검증: Flutter 3.47.7 stable / Dart 3.13.5
- 현재 Windows Unit/Widget 검증: Flutter 3.47.5 stable / Dart 3.13.4
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
flutter run --dart-define-from-file=config/development.local.json
```

macOS에서는 `flutter pub get`을 실행하기 전에도 위 Xcode 경로를 적용합니다. 플러그인 Swift Package 생성에 Xcode가 필요하며, 이 프로젝트는 현재 iOS 플러그인을 Swift Package Manager로 연결합니다.

## 지도 실행 설정

`config/development.example.json`을 `config/development.local.json`으로 복사하고 `MAPBOX_ACCESS_TOKEN`에 Mapbox 공개 토큰(`pk.`)을 입력합니다. 로컬 파일은 Git에서 제외됩니다. 다른 개발자는 자신의 토큰으로 같은 파일을 만듭니다.

현재 개발 Mac에는 로컬 설정과 Android Studio 실행 구성 `igilro (Mapbox)`을 준비했습니다. Android Studio 상단 실행 구성에서 이를 선택한 뒤 Android Emulator 또는 iOS Simulator를 선택하고 Run을 누릅니다. 표시되지 않으면 Run → Edit Configurations의 Flutter 구성에서 Additional run args에 다음 값을 입력합니다.

```text
--dart-define-from-file=config/development.local.json
```

토큰 없이 실행하면 지도가 준비되지 않은 화면이 표시됩니다. 공개 토큰은 소스에서 제외해도 빌드된 앱에 포함됩니다. 비밀 토큰(`sk.`)은 앱에 넣지 않습니다. 토큰 설정은 [Mapbox 공식 설치 안내](https://docs.mapbox.com/flutter/maps/guides/install/)를 기준으로 합니다.

처음에는 서울시청 주변을 표시합니다. ‘현재 위치를 출발지로’ 버튼을 누르면 앱 사용 중 위치 권한을 요청하고 위치를 한 번 획득해 마커를 표시하고 카메라를 이동합니다. 정확도는 화면에 미터 단위로 표시하며, 권한을 허용하지 않아도 지도를 이동·확대할 수 있습니다. 백그라운드 추적과 이동 중 자동 갱신은 현재 범위에 포함하지 않습니다. Mapbox 로고와 attribution은 SDK 기본 표시를 유지합니다.

## 출발지·도착지 선택

- ‘현재 위치를 출발지로’를 누르면 획득한 좌표를 출발지로 설정합니다.
- 출발지 또는 도착지 항목을 누른 뒤 지도에서 위치를 고르고 ‘출발지로 선택’ / ‘도착지로 선택’으로 확정합니다. 주황색 핀은 선택 중인 후보이고, 취소하면 기존 위치가 유지됩니다.
- 확정된 출발지는 초록색, 도착지는 파란색 핀으로 표시합니다. 교환 아이콘은 두 지점의 좌표와 출처를 함께 바꾸고 각 항목의 삭제 버튼은 해당 지점만 지웁니다.
- 서로 다른 두 지점이 준비되면 ‘두 지점 보기’를 사용할 수 있습니다. 검색 결과가 있으면 ‘전체 경로 보기’로 바뀌며, 지도의 실제 크기에 맞춰 전체 경로와 두 핀이 보이도록 카메라를 조정합니다. 이 버튼은 기존 선택·결과를 보여주며 경로 검색 요청은 보내지 않습니다.

지도 선택에는 위치 권한이 필요하지 않습니다. 지도 준비 중이나 로드 실패 시 선택 확정을 막으며, 지도 재시도는 선택한 출발지/도착지를 유지합니다. 좌표는 장소명 검색 API를 연결하기 전의 표시이며, 임의의 주소나 예상 경로를 만들어 보여주지 않습니다.

## 기본 도보 경로 검색

서로 다른 출발지·도착지를 확정한 뒤 ‘경로 검색’을 누르면 `POST /api/v1/routes/search`를 호출합니다. 요청은 `origin`, `destination`, `travelMode: walking`, `mode: fastest`, UTC `departureAt`만 포함합니다. 장소 검색 API 없이 지도 선택 좌표로 검색할 수 있습니다. 서버의 현재 지원 지역은 서울숲 pilot이며, 지역 밖 요청과 연결 가능한 보행로가 없는 경우를 구분해 안내합니다.

검색 중 중복 요청을 막고 실패하면 다시 검색할 수 있습니다. 출발지·도착지를 교환·삭제·변경하면 이전 결과와 진행 중 요청을 정리합니다. 지도에서 후보를 미리 본 뒤 취소하면 확정한 좌표와 검색 결과는 유지합니다.

시간·거리는 스냅된 보행로 시작점과 끝점 사이의 네트워크 경로 기준입니다. 선택한 핀에서 보행로까지의 접근 거리와 실제 보행로 좌표를 별도로 표시하며, 접근 거리를 경로 거리·시간에 더하지 않습니다. 응답 GeoJSON의 모든 좌표를 초록색 경로선으로 그리고 선택한 출발·도착 핀은 유지합니다. 핀과 스냅 지점 사이에 임의의 연결선을 추가하지 않습니다. OSM 출처와 제공된 건물 출처는 구분해서 표시합니다.

검색 성공 시 전체 경로와 입력 핀을 함께 맞추고 결과 패널·화면 회전으로 지도 크기가 바뀌면 레이아웃 이후 다시 범위를 계산합니다. 재검색·오류·확정 좌표 변경 시 이전 경로선을 지우며, 후보 선택 취소는 기존 결과를 보존합니다. 지도 재시도와 스타일 재로딩 시 현재 경로선과 핀을 복원합니다.

`shadeEvaluation`의 상태·커버리지·건물 버전·출처·태양 고도, 모델 버전과 기준 시간도 보존합니다. 미평가 환경 지표의 null을 0으로 대체하지 않습니다. 그늘 상태는 경로 검색 자체의 성공 여부와 별개이며, 현재 UI에는 그늘 모드나 환경 점수를 노출하지 않습니다. 추가 응답 필드는 허용하고 요청에는 계약에 정의된 필드만 전송합니다.

## 환경 설정

`APP_ENV`: development, staging, production. Debug/Profile의 기본값은 development이고, Release의 기본값은 production입니다.

`API_BASE_URL`: 서버 origin만 지정하며 포트는 1~65535 범위입니다. 경로·query·fragment·자격 증명을 포함하지 않습니다. 개발 환경에서 생략하면 http://localhost:8080을 사용합니다. staging/production은 명시적인 HTTPS 주소가 필요합니다. dart-define에는 앱에 포함되는 공개 설정만 넣습니다.

Android Emulator에서 개발 Mac의 서버를 사용할 때:

```sh
flutter run --dart-define-from-file=config/development.local.json --dart-define=API_BASE_URL=http://10.0.2.2:8080
```

iOS Simulator에서:

```sh
flutter run --dart-define-from-file=config/development.local.json --dart-define=API_BASE_URL=http://localhost:8080
```

실제 기기는 접근 가능한 개발 서버의 네트워크 주소를 사용합니다. Android debug manifest는 개발 HTTP 통신을 허용하고, iOS는 로컬 네트워크 통신 설정과 사용 설명을 제공합니다. staging/production API 주소는 기존대로 HTTPS가 필요합니다. 실제 서버·DB를 실행하고 서버가 지원하는 지역의 좌표를 선택해 기기 통합 검증을 수행합니다. 기본 Unit/Widget 테스트는 실제 서버를 호출하지 않습니다.

Windows의 한글 사용자 캐시 경로에서 셰이더 컴파일이 실패한다면 프로젝트 내부 영문 경로를 해당 터미널의 캐시·임시 경로로 사용합니다. 이 설정은 전역 환경 변수를 변경하지 않으며 캐시 파일은 Git에서 제외됩니다.

```powershell
$env:PUB_CACHE = Join-Path (Get-Location).Path '.dart_tool/pub-cache'
$env:TEMP = Join-Path (Get-Location).Path '.dart_tool/tmp'
$env:TMP = $env:TEMP
New-Item -ItemType Directory -Force -Path $env:TEMP | Out-Null
flutter pub get --enforce-lockfile
```

운영 빌드는 실제 서버 주소를 지정합니다. 아래 example 주소는 문법 설명용입니다.

```sh
flutter build appbundle --dart-define=APP_ENV=production --dart-define=API_BASE_URL=https://api.example.com --dart-define=MAPBOX_ACCESS_TOKEN="$MAPBOX_ACCESS_TOKEN"
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
| mapbox_maps_flutter | 지도·마커·카메라의 Android/iOS SDK 렌더링 |
| geolocator | 위치 서비스·권한 확인·현재 좌표 획득·기기 설정 열기 |
| integration_test | 실제 네이티브 지도와 위치 플러그인 연결 검증 |

위치와 경로 검색 기능은 Domain Repository/UseCase/Entity와 DataSource/Mapper/구현체를 분리했습니다. 위치 플러그인의 Position과 서버 경로 DTO는 각 Mapper에서 Domain Entity로 변환합니다. Mapbox SDK 객체는 지도 어댑터 안에서 관리합니다.

Android는 AGP 9.1과 `android.builtInKotlin=true`를 사용합니다. `settings.gradle.kts`의 Kotlin 2.4 선언은 내장 컴파일러의 버전을 올리며 앱에 별도 Kotlin Android 플러그인을 적용하지 않습니다. [Flutter 내장 Kotlin 안내](https://docs.flutter.dev/release/breaking-changes/migrate-to-built-in-kotlin/for-app-developers)를 참고합니다.

## 검증

2026-10-23 Windows 환경에서 Unit/Widget 테스트 177개, 정적 분석과 포맷 검사를 통과했습니다. 실제 서버·기기 연결과 네이티브 경로선·카메라 통합 테스트는 아직 실행하지 않았습니다. 현재 Windows SDK에는 NDK 27.1.12297006만 설치되어 있고 Flutter가 요구하는 28.2.13676358과 Mapbox 로컬 토큰 설정이 필요합니다. iOS 빌드·기기 검증은 macOS에서 수행합니다.

```sh
dart run build_runner build
dart format --output=none --set-exit-if-changed lib test integration_test
flutter analyze --no-pub
flutter test --no-pub --coverage
flutter build apk --debug --no-pub --dart-define-from-file=config/development.local.json
flutter build ios --simulator --debug --no-pub --dart-define-from-file=config/development.local.json
```

Unit/Widget 테스트는 Fake HTTP adapter·위치 Repository·플랫폼 구현·지도 surface를 사용하며 외부 서버를 호출하지 않습니다. 생성 파일은 직접 수정하지 않고 소스와 함께 저장소에 포함합니다. GitHub Actions는 생성 파일 일치·포맷·분석·테스트·토큰 없는 Android debug 빌드를 검사합니다.

실제 기기 통합 테스트는 Mapbox 네트워크 접근, 위치 서비스와 유효한 테스트 좌표가 필요합니다. 실행 중 표시되는 위치 권한 창에서 사용 중 접근을 허용합니다. 테스트 실행기가 앱을 재설치하면 사전에 부여한 Simulator 권한이 초기화될 수 있으므로 설치 후 권한을 설정해야 합니다. 일반 CI의 Unit/Widget 테스트와 별도로 실행합니다.

통합 테스트는 실제 지도/위치 플러그인과 SDK의 테스트용 `dispatch`를 사용해 네이티브 클릭 이벤트 → 후보 선택 → 확정 → 카메라 영역에 두 좌표 포함을 검증합니다. 이후 Fake Repository의 우회 경로로 네이티브 경로선 조회, 모든 경로 좌표의 카메라 포함, 스타일 재로딩 복원과 좌표 삭제 시 경로선 제거를 검증합니다. 경로 fixture는 서버 계산·통신 검증을 대체하지 않으며, 물리적인 터치 입력과 실제 서버 연결은 기기에서 별도로 확인합니다.

```sh
flutter test integration_test/map_location_test.dart -d <device-id> --dart-define-from-file=config/development.local.json
```

- [아키텍처와 의존성 규칙](docs/architecture.md)
- [서버 Codex 전달 문서](docs/server_handoff.md)
