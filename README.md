# 이길로 · igilro

사용자가 원하는 환경과 상황에 맞는 도보 경로를 찾는 Flutter 앱입니다. Mapbox는 지도를 렌더링하고, 별도의 Kotlin/Spring Boot 서버가 경로 추천과 환경 점수를 계산합니다.

지도를 중심으로 상단 출발·도착 입력과 하단 경로 선택·안내 시작을 제공합니다. 장소 검색, 현재 위치, 지도 선택으로 두 지점을 설정하고 전체 경로를 지도에 표시합니다. 접근 거리·출처·예측 한계는 상세 보기에서 확인합니다.

기본 화면은 ‘그늘길’입니다. 서버에서 검색 범위·보행망·출입 지점을 조회하고 같은 좌표·출발 시각으로 빠른 길과 그늘 많은 길을 비교합니다. 선택 경로는 서버가 제공한 그늘·햇빛 구간으로 표시하며 GPS 안내와 가상 이동 미리보기로 이어집니다. 기존 높이 기반 도보 API는 별도 ‘도보’ 선택으로 유지합니다.

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

처음에는 서울숲 시범 지역을 표시합니다. 2D/3D 전환과 현재 위치 이동을 제공하며 Mapbox 로고와 attribution은 SDK 기본 표시를 유지합니다. 3D 건물 그림자는 날짜·시각의 태양 위치로 Mapbox 자료를 조명한 시각 표현입니다. 서버의 공공 3D 모델과 건물 자료가 다르므로 서버 예측 그늘 영역과 동일하다고 해석하지 않습니다. 밤에는 태양 그림자를 표시하지 않습니다.

## 출발지·도착지 선택

- 상단 출발·도착 항목에서 장소명·주소를 검색하거나 ‘지도에서 선택’을 누릅니다. 장소 검색은 서버 `GET /api/v1/places/search`를 사용하며 350ms 입력 지연과 이전 요청 취소를 적용합니다. 공급자 출처 링크를 표시하고 서버 검색 설정이 없으면 지도 선택을 안내합니다.
- 출발 항목의 ‘현재 위치에서 출발’을 누르면 권한을 확인하고 획득한 좌표를 출발지로 설정합니다.
- 지도에서 위치를 고른 뒤 ‘출발지로 선택’ / ‘도착지로 선택’으로 확정합니다. 주황색 핀은 선택 중인 후보이고, 취소하면 기존 위치가 유지됩니다.
- ‘그늘길’ 지도의 출입 지점 핀을 누르면 해당 이름·좌표를 출발지 또는 도착지로 설정할 수 있습니다. ‘서울숲 검색 범위’로 coverage bounds에 맞춰 이동하고, 정보 버튼에서 스냅 한도와 출처를 확인합니다.
- 확정된 출발지는 초록색, 도착지는 파란색 핀으로 표시합니다. 교환 아이콘은 두 지점의 좌표와 출처를 함께 바꾸고 각 항목의 삭제 버튼은 해당 지점만 지웁니다.
- 상단의 ‘전체 경로 보기’ 아이콘은 지도 크기에 맞춰 전체 경로·비교 경로와 입력 핀을 함께 맞춥니다. 경로 검색 요청은 보내지 않습니다.

지도 선택에는 위치 권한이 필요하지 않습니다. 지도 준비 중이나 로드 실패 시 선택 확정을 막으며, 지도 재시도는 선택한 출발지/도착지를 유지합니다. 장소명은 검색 응답이 있을 때만 사용합니다.

## 기본 도보 경로 검색

서로 다른 출발지·도착지를 확정한 뒤 ‘경로 검색’을 누르면 `POST /api/v1/routes/search`를 호출합니다. 요청은 `origin`, `destination`, `travelMode: walking`, `mode: fastest`, UTC `departureAt`만 포함합니다. 장소 검색 API 없이 지도 선택 좌표로 검색할 수 있습니다. 서버의 현재 지원 지역은 서울숲 pilot이며, 지역 밖 요청과 연결 가능한 보행로가 없는 경우를 구분해 안내합니다.

검색 중 중복 요청을 막고 실패하면 다시 검색할 수 있습니다. 출발지·도착지를 교환·삭제·변경하면 이전 결과와 진행 중 요청을 정리합니다. 지도에서 후보를 미리 본 뒤 취소하면 확정한 좌표와 검색 결과는 유지합니다.

시간·거리는 스냅된 보행로 시작점과 끝점 사이의 네트워크 경로 기준입니다. 선택한 핀에서 보행로까지의 접근 거리와 실제 보행로 좌표를 별도로 표시하며, 접근 거리를 경로 거리·시간에 더하지 않습니다. 응답 GeoJSON의 모든 좌표를 초록색 경로선으로 그리고 선택한 출발·도착 핀은 유지합니다. 핀과 스냅 지점 사이에 임의의 연결선을 추가하지 않습니다. OSM 출처와 제공된 건물 출처는 구분해서 표시합니다.

검색 성공 시 전체 경로와 입력 핀을 함께 맞추고 결과 패널·화면 회전으로 지도 크기가 바뀌면 레이아웃 이후 다시 범위를 계산합니다. 재검색·오류·확정 좌표 변경 시 이전 경로선을 지우며, 후보 선택 취소는 기존 결과를 보존합니다. 지도 재시도와 스타일 재로딩 시 현재 경로선과 핀을 복원합니다.

`shadeEvaluation`의 상태·커버리지·건물 버전·출처·태양 고도, 모델 버전과 기준 시간도 보존합니다. 미평가 환경 지표의 null을 0으로 대체하지 않습니다. 그늘 상태는 경로 검색 자체의 성공 여부와 별개이며, 현재 UI에는 그늘 모드나 환경 점수를 노출하지 않습니다. 추가 응답 필드는 허용하고 요청에는 계약에 정의된 필드만 전송합니다.

## 공공 3D 모델 기반 경로 예측

`POST /api/v1/routes/predictions/search`를 사용합니다. ‘도보’는 기존 `/api/v1/routes/search`를 유지하며 검색 종류를 전환하면 이전 결과와 진행 중 요청을 정리합니다. 예측의 빠른 길도 예측 전용 endpoint를 사용합니다.

- ‘그늘길 비교’는 `mode: fastest`와 `mode: shade`를 순서대로 호출합니다. `travelMode`는 walking입니다. 자료 버전·평가 시각·snapping·기준 시간의 일치 여부를 검증합니다. 탐색 알고리즘의 routingModelVersion은 모드별로 달라도 유효합니다.
- 날짜·시각을 지정하면 현지 시각을 UTC로 변환합니다. 미지정 비교도 클라이언트에서 현재 시각 하나를 확정해 두 요청에 동일하게 보냅니다. 결과 카드 선택은 추가 통신 없이 표시 경로만 바꿉니다.
- 전체 LineString을 바탕 선으로 유지하고 선택 경로의 `shadeSegments`를 모든 꺾이는 좌표 그대로 순서대로 그립니다. SHADE는 초록, SUNLIGHT는 주황이며 대안 경로는 옅은 선입니다. 선택 핀·현재 위치는 경로 위에 표시하고 실제 스냅 시작·끝점은 작은 원으로 구분합니다. 접근선을 만들어 추가하지 않습니다.
- 카드에는 ‘예측 그늘 54.6%’를 표시하고 상세 보기에 모델 한계를 설명합니다. physicalShadeCoverage가 null이면 ‘미검증’으로 표시하고 예측 0도 유효한 모델 값으로 유지합니다. 특히 공원의 나무 그늘은 반영하지 않으므로 0%를 실제 그늘 없음으로 해석하지 않습니다.
- 서버 attribution을 표시하고 버전·자료 품질·limitations·건물/지형 개수·샘플 간격·투영 오차 등의 진단값을 보존합니다. 브이월드·건축HUB 키는 서버에서만 사용합니다.
- 좌표·시각·검색 종류 변경은 비교 결과를 초기화하고 진행 중 요청을 취소합니다. 서버 code와 requestId를 보존하고 진단용 message는 화면에 노출하지 않습니다.

`GET /api/v1/routes/predictions/coverage`의 bounds·center·MultiLineString 보행망·출입 지점·스냅 한도·버전·연결성·출처를 별도 DTO/Domain으로 보존합니다. 범위와 스냅 한도는 앱에 고정하지 않습니다. 범위 안에도 보행로에서 멀거나 연결되지 않은 위치가 있으며 실제 경로 존재 여부는 서버 검색으로 판단합니다. coverage 실패 시 수동 재시도를 제공하고 경로 검색 요청과 별도로 취소합니다.

그늘 구간의 상태·형상까지 렌더링 캐시에 포함하므로 출발 시각만 바뀌어 전체 경로가 같아도 색상을 갱신합니다. 스타일 재로딩 시 coverage와 구간을 함께 복원하고 입력 변경·검색 실패 시 이전 경로의 색상을 제거합니다. 구간이 없는 이전 예측 응답은 중립 선으로 표시하며 전체 비율로 색상을 추정하지 않습니다.

실제 서버를 대상으로 고정 요청을 확인하려면 다음 명령을 사용합니다. Mapbox 토큰 없이 앱과 동일한 Dio·DTO·Mapper·Repository를 실행하며 오프라인 Unit/Widget 테스트에서는 실행하지 않습니다.

```sh
dart run tool/verify_route_predictions.dart --base-url http://localhost:8080 --check-snapshot
```

고정 출발 `(127.0374, 37.5445)`, 도착 `(127.0430, 37.5480)`, 출발 시각 `2026-10-28T11:00:00+09:00`을 사용합니다. 2026-10-29 실제 서버 확인 결과는 fastest 800.7m/572초/+0초/31.1%, shade 865.6m/619초/+47초/54.6%이며 각각 그늘·햇빛 구간 4개입니다. evaluatedAt·그래프·예측 장면·snapping과 coverage 버전도 일치했습니다. 서버가 공유한 전체 응답은 [fastest fixture](test/fixtures/seoul_forest_prediction_fastest.json)와 [shade fixture](test/fixtures/seoul_forest_prediction_shade.json)에 보존합니다. 이전 짧은 경로 fixture는 구간이 없는 응답의 호환 테스트용으로 유지합니다. 데이터 갱신 후에는 `--check-snapshot`을 생략해 동일 조건과 구간 구조를 확인할 수 있습니다.

Debug 앱에서는 홈 오른쪽 위 **더보기 → 테스트 경로**로 같은 검증 조건을 사용할 수 있습니다. 두 좌표·출발 시각을 설정하고 실제 예측 API에서 빠른 길과 그늘길을 모두 검색합니다. Release 앱에는 개발용 버튼을 표시하지 않습니다.

## 경로 안내와 미리보기

‘안내 시작’은 위치 권한과 서비스를 확인한 뒤 앱 사용 중 GPS 갱신을 구독합니다. 경로에 투영한 진행률·남은 거리·방향으로 카메라를 제어하고, 사용자가 지도를 터치하면 자동 추종을 멈춥니다. ‘따라가기’로 복귀할 수 있습니다. 경로에서 떨어진 위치에는 접근 안내를 표시하고, 이탈이 연속 확인되면 현재 위치로 재검색할 수 있습니다. 오래되거나 부정확한 GPS로 진행률을 갱신하지 않습니다. 앱이 백그라운드로 가면 위치 구독을 해제하고 안내를 일시 정지합니다.

‘미리보기’는 GPS를 사용하지 않는 가상 이동으로 화면에 명시합니다. 종료하면 가상 위치도 제거합니다. 현장 보행·교차로 회전 안내·음성 안내 검증은 별도이며 현재 API에는 회전 지시 데이터가 없습니다.

선택한 전체 경로를 기존 안내에 전달하며 구간별 색상은 안내 중에도 유지합니다. 서버의 `shadeSegments`가 경로 색상의 기준이며 Mapbox 3D 그림자는 별도의 시각 표현입니다. 현재 응답에는 실제 그림자 polygon이나 공공 3D mesh가 없습니다.

## 환경 설정

`APP_ENV`: development, staging, production. Debug/Profile의 기본값은 development이고, Release의 기본값은 production입니다.

`API_BASE_URL`: 서버 origin만 지정하며 포트는 1~65535 범위입니다. 경로·query·fragment·자격 증명을 포함하지 않습니다. 개발 환경에서 생략하면 http://localhost:8080을 사용합니다. staging/production은 명시적인 HTTPS 주소가 필요합니다. dart-define에는 앱에 포함되는 공개 설정만 넣습니다.

Android Emulator에서 같은 개발 PC의 서버를 사용할 때:

```sh
flutter run --dart-define-from-file=config/development.local.json --dart-define=API_BASE_URL=http://10.0.2.2:8080
```

iOS Simulator에서:

```sh
flutter run --dart-define-from-file=config/development.local.json --dart-define=API_BASE_URL=http://localhost:8080
```

USB로 연결한 Android 실기기에서 같은 PC의 서버를 사용할 때는 아래 개발용 포트 연결을 설정하면 `API_BASE_URL=http://localhost:8080`을 유지할 수 있습니다. 포트 연결이 없으면 휴대폰의 localhost는 휴대폰 자신을 가리킵니다.

```sh
adb reverse tcp:8080 tcp:8080
adb reverse --list
```

기기 재부팅이나 USB 재연결 후에는 연결 목록을 확인하고 필요하면 다시 설정합니다. 2026-10-27 삼성 SM-A165N에서 이 연결을 통해 상태 API의 HTTP 200과 고정 그늘 예측 요청의 HTTP 200(93.5m, 67초, 예측 그늘 68.6%)을 확인했습니다.

USB 포트 연결을 사용하지 않는 실제 기기는 접근 가능한 개발 서버의 네트워크 주소를 사용합니다. Android debug manifest는 개발 HTTP 통신을 허용하고, iOS는 로컬 네트워크 통신 설정과 사용 설명을 제공합니다. staging/production API 주소는 기존대로 HTTPS가 필요합니다. 실제 서버·DB를 실행하고 서버가 지원하는 지역의 좌표를 선택해 기기 통합 검증을 수행합니다. 기본 Unit/Widget 테스트는 실제 서버를 호출하지 않습니다.

Windows의 한글 사용자 캐시 경로에서 셰이더 컴파일이 실패한다면 Pub 캐시를 영문 경로로 지정합니다. 터미널에만 설정하면 Android Studio의 `pub get`에서 한글 경로로 되돌아갈 수 있으므로 아래 예시는 사용자 환경 변수에도 기본값을 저장합니다. 패키지 버전은 잠금 파일을 유지합니다.

```powershell
$env:PUB_CACHE = 'C:\dev\pub-cache'
[Environment]::SetEnvironmentVariable('PUB_CACHE', $env:PUB_CACHE, 'User')
New-Item -ItemType Directory -Force -Path $env:PUB_CACHE | Out-Null
$env:TEMP = Join-Path (Get-Location).Path '.dart_tool/tmp'
$env:TMP = $env:TEMP
New-Item -ItemType Directory -Force -Path $env:TEMP | Out-Null
flutter pub get --enforce-lockfile
```

새 기본값을 IDE의 자동 `pub get`에도 적용하려면 Android Studio를 완전히 종료한 뒤 다시 엽니다. 이미 열려 있는 IDE에서 Run을 사용할 때는 Run → Edit Configurations → main.dart → Environment variables에 `PUB_CACHE=C:\dev\pub-cache`를 저장합니다. `TEMP`와 `TMP`도 프로젝트의 `.dart_tool\tmp` 영문 절대 경로로 지정할 수 있습니다. 캐시 경로를 바꾼 뒤에는 위의 `pub get`을 한 번 실행해야 하며, Run만으로는 이전 패키지 경로가 갱신되지 않을 수 있습니다.

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

2026-10-27 Windows 환경에서 Unit/Widget 테스트 233개, 정적 분석과 포맷 검사를 통과했습니다. 실제 예측 서버의 고정 fastest/shade 요청도 앱과 동일한 Dio·DTO·Mapper·Repository로 검증했습니다. Flutter가 지정한 Android NDK 28.2.13676358을 설치하고 영문 Pub 캐시를 적용한 뒤 Android debug APK 빌드도 통과했습니다. Android Studio의 main.dart 실행 환경에도 영문 경로를 저장하고 삼성 SM-A165N에서 Run 재실행, 홈 화면 표시와 디버깅 연결을 확인했습니다. 같은 기기의 테스트 경로 버튼으로 실제 서버 검색과 화면의 93.5m·67초·예측 그늘 68.6% 표시도 확인했습니다. 네이티브 지도·카메라의 자동 통합 테스트와 iOS 빌드·기기 검증은 별도로 수행합니다.

2026-10-28 지도 중심 UI·비교 검색·전경 GPS 안내·미리보기를 반영한 Unit/Widget 테스트 244개, 정적 분석·포맷 검사와 Android debug APK 빌드가 통과했습니다. 현재 시각 검색 후 카드 전환, 수동 지도 이동 중 위치 갱신, 가상 위치 제거, 장소 선택 출처 보존을 포함합니다. 새 UI의 실기기 시각 검증과 현장 보행 검증은 휴대폰 잠금 해제 후 별도로 수행합니다.

2026-10-29 구현 점검 후 테스트 270개, 정적 분석·포맷 검사와 Android debug APK 빌드가 통과했습니다. SDK 플랫폼 경계를 대체한 테스트에서 같은 전체 경로의 구간 색상 변경·삭제·스타일 재구성·출입 지점 tap 전달을 검증하고, 화면 테스트에서 지도 좌표 확정 → 두 모드 비교 → 구간 표시 → 전체 경로 GPS 안내를 확인했습니다. GPS 갱신 중단 시 20초 후 신호 대기로 전환하고 새 위치로 복구하며, 안내 재개 시 카메라 추종을 다시 켭니다. 지도 초기화 중 해제 후 후속 SDK 호출이 이어지지 않는지도 재현 테스트로 확인했습니다. 실제 서버의 coverage와 새 재현 예제도 Dio/DTO/Mapper로 검증했습니다. 휴대폰 화면·현장 보행과 iOS 기기 확인은 별도입니다.

같은 날 원격 main의 장소 검색·도보 결과 카드·크기 조절 패널·서버 검증 기록을 통합했습니다. 장소 검색의 DTO·Domain·Repository·Provider를 하나로 공유하며 한글 조합 입력 중에는 요청을 지연하고 공급자 출처와 장소 ID를 보존합니다. 경로 요청에는 기존 계약 필드만 전달합니다. 하단 손잡이로 지도와 결과 영역 크기를 조절할 수 있고, 일반 도보의 건물 그늘 요약과 상세 카드도 유지합니다. 모델 예측 결과와 직접 높이 평가 결과는 계속 구분합니다. 통합 후 전체 테스트 320개·정적 분석·포맷·Android debug 빌드가 통과했습니다. 원격의 기존 실서버·기기 검증 기록은 [별도 문서](docs/server_integration_verification.md)에 보존하며 현재 UI에 맞춘 기기 테스트 실행은 별도로 수행합니다.

```sh
dart run build_runner build
dart format --output=none --set-exit-if-changed lib test integration_test tool
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
