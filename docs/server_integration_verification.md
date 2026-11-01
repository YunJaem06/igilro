# 실제 서버 연동 검증

## 2026-10-31 전체 길안내 목록과 지도 연동

이전 변경을 `2a2ec09`(위치), `18b8da8`(검색 제출), `83c283f`(서버 안내), `fa4a0af`(기기 검증), `a307ac1`(문서)의 5개 커밋으로 정리했다. 이후 전체 길안내 목록과 지도 연동을 추가했다.

- 일반 도보·빠른 길·그늘길의 검색 결과와 상세 보기, 안내 중 화면에서 서버의 전체 안내 목록을 연다. 안내 항목을 선택하면 해당 좌표로 카메라를 이동하고 주황색 안내 지점과 설명 카드를 표시한다. GPS 좌표·입력 지점·경로·진행률은 수동 선택으로 변경하지 않는다.
- 신뢰할 수 있는 안내 진행 중에는 현재 구간 시작과 다음 안내 지점을 별도로 표시한다. 목록의 현재·다음 상태도 갱신한다. GPS 품질이 나쁘면 자동 강조를 숨기고, 따라가기·전체 경로 보기·경로 변경 시 수동 선택을 해제한다. 오래 열린 목록의 이전 경로 콜백은 무시한다.
- Unit/Widget 366개와 정적 분석·218개 파일 포맷 검사가 통과했다. 원본 geometry 기반 단계 진행, 늦은 콜백, 모드 전환, GPS 지속 갱신, 미지원 출처·maneuver, 큰 글꼴의 긴 목록, 네이티브 오버레이 캐시·삭제·스타일 재생성 복원을 검사했다.
- Android/iOS 각각 `live_route_search_test.dart`와 `live_route_prediction_test.dart`가 통과했다. 실제 일반 도보 경로에서 선택 지점의 네이티브 카메라 중심과 `igilro.guidance-points` 렌더링·삭제를 확인했다. 모델 두 모드에서도 전체 목록·지점 선택·전체 경로 복귀·미리보기의 현재/다음 표시를 확인했다. 현장 보행 검증은 포함하지 않는다.
- 추가 서버 API·키·의존성은 필요하지 않다. 기존 `routes[].guidance`와 전체 경로 geometry를 사용한다.

2026-11-01 커밋 전 Unit/Widget 366개, 정적 분석, 218개 파일 포맷 검사와 Android debug APK 빌드를 다시 통과했다. 코드 재생성 후 소스·생성 파일 내용은 바뀌지 않았다. Android/iOS 실제 서버 통합 테스트 4개의 기기 검증일은 위 기록과 같이 2026-10-31이다.

## 2026-10-31 기본 그늘길·검색 제출·서버 길안내 후속 검증

일반 도보와 모델 예측의 guidance DTO·Domain·Mapper·다음 안내 계산·화면을 연결했다. 실제 건물 모델 3,064개·DEM 285개의 scene.json과 체크섬 일치 roads.osm을 준비해 로컬 서버 설정에 연결했다. [장면 경로·원본 시각·체크섬과 API 결과](server_handoff.md#2026-10-31-실제-모델-장면과-길안내-연결)를 기록했다.

- coverage가 HTTP 200, 보행선 1,277개·출입 지점 7개를 반환했다. 공급자 키와 원본 캐시·장면은 Git에서 제외한다.
- 실제 Dio·DTO·Mapper·Repository로 fastest 800.7m/572초/모델 예측 그늘 31.1%/안내 19단계, shade 865.6m/619초/54.6%/안내 23단계를 확인했다. 평가 시각·그래프·장면·snapping이 일치하고 각 4개 그늘/햇빛 구간을 보존했다. physicalShadeCoverage=null과 실험적 부분 모델 품질은 그대로다.
- Unit/Widget 356개, 정적 분석·포맷 검사·생성 코드 갱신이 통과했다. 검색 키 즉시 제출과 한글 조합 완료, 중복 debounce 방지, 실제 응답 fixture의 안내 인덱스·좌표·거리/시간, 미지원 식별자와 횡단 신호 true/false/null, GPS 품질·다음 단계 전환·큰 글꼴을 검사했다.
- Android/iOS 각각 `live_route_prediction_test.dart`와 `live_route_search_test.dart`가 통과했다. 기본 그늘길 화면의 실제 coverage·경로 비교, 두 모드의 서버 안내 문구와 명시적 가상 이동, 일반 도보 안내·422/404·TCP 실패 후 복구를 검증했다. 안내 진입·종료 때 재생성되는 네이티브 지도의 현재 참조를 기다린다.

이번 네이티브 테스트 4개는 Fake Repository나 고정 HTTP 응답을 사용하지 않는다. 시뮬레이터 좌표와 SDK dispatch를 사용하며, 미리보기는 화면에 표시한 가상 이동이다. 실제 보행 중 GPS·횡단·회전 안내의 현장 정확도나 실측 그늘 비율을 검증한 결과는 아니다. 아래 이전 날짜의 기록은 당시 데이터와 구현의 검증 이력이다.

검증일: 2026-10-24 (Asia/Seoul). 초기 연동 검증의 Flutter 기준 커밋은 `80cd6d3`, 서버 기준 커밋은 `6eeb67e`다. 후속 결과 카드 검증은 현재 Flutter 작업 트리의 변경을 포함한다.

## 실행 환경과 실제 데이터

- macOS Apple Silicon, Flutter 3.47.7 / Dart 3.13.5.
- iPhone 18 Pro / iOS 27.0 Simulator, Pixel 10 / Android 17 Emulator.
- Java 21, Spring Boot 4.1.1의 현재 서버 소스로 `bootJar`를 다시 빌드했다.
- Docker Desktop의 기존 PostGIS 개발 볼륨을 재사용했다. 보행 그래프는 실제 OSM 노드 5,733개·구간 6,268개이며 새 합성 데이터를 넣지 않았다.
- 데이터 버전: `osm-v1-49f53ea1a6d5cb06c4c4e5443d0a9a147abb3d4e53db384f2135be4c644220c4`.
- 서버 시작 시 Flyway V3가 적용됐고 기존 보행 그래프는 유지됐다. 건물 데이터는 적재하지 않아 그늘 평가는 `DATA_UNAVAILABLE`, `shadeRatio`는 null이다.

서버와 개발 DB는 이번 검증 후 실행 상태로 유지했다. 이후 세션에서는 서버 README의 실행 절차로 다시 시작한다.

## 실제 HTTP와 앱 결과

기본 요청은 출발 `{longitude: 127.0374, latitude: 37.5445}`, 도착 `{longitude: 127.0430, latitude: 37.5480}`, `walking` / `fastest`다. 앱은 위치 플러그인으로 출발지를 획득하고 네이티브 지도에서 도착지를 선택한 뒤 실제 Dio → Repository → 서버 경로 검색을 수행했다.

| 확인 항목 | 실제 결과 |
| --- | --- |
| 서버·PostGIS 상태 | `/api/v1/health` HTTP 200 / UP |
| 직접 HTTP 경로 요청 | HTTP 200, 800.8m / 573초, GeoJSON 좌표 40개 |
| iOS 앱 경로 요청 | HTTP 200, 800.8m / 573초, 좌표 40개 |
| Android 앱 경로 요청 | HTTP 200, 801.0m / 573초, 좌표 40개 |
| 두 앱의 결과 화면 | `10분 · 801m`, 스냅 위치·접근 거리·OSM 출처 표시 |
| 경로선·카메라 | 네이티브 경로 레이어에 선이 표시되고 모든 경로 좌표와 입력 핀이 카메라 범위에 포함됨 |
| 지원 지역 밖 | 서울시청 좌표를 출발지로 선택 → HTTP 422 / `OUTSIDE_SUPPORTED_AREA`, 대응하는 한국어 안내 |
| 지원 지역 안의 경로 없음 | 출발 `127.0271, 37.5331` → HTTP 404 / `ROUTE_NOT_FOUND`, 대응하는 한국어 안내 |
| 실제 연결 실패 | 앱의 실제 Dio가 사용하지 않는 로컬 TCP 포트로 연결 → 네트워크 오류 안내 |
| 연결 복구·재검색 | 원래 API 주소로 복구 후 다시 검색 → HTTP 200, 경로선 다시 표시 |

오류 검증은 iOS·Android 양쪽에서 수행했다. 입력 변경·검색 오류 시 이전 경로선이 제거되는 것도 확인했다. 연결 실패 검증은 실제 TCP 연결 거부를 사용하며 개발 서버나 DB를 중지하지 않는다.

## 통합 테스트

최종 검증은 포맷·정적 분석·Unit/Widget 177개와 iOS 통합 테스트 2개, Android 통합 테스트 2개가 모두 통과했다. 각 플랫폼에서 실제 HTTP 테스트와 경로선·스타일 복원 테스트를 별도로 실행했다.

`integration_test/live_route_search_test.dart`는 Fake Repository나 고정 HTTP 응답을 사용하지 않는다. 실제 서버·서울숲 그래프, 로컬 Mapbox 공개 토큰과 위치 서비스가 필요하며 기본 CI의 Unit/Widget 테스트와 별도로 실행한다.

```sh
# 먼저 별도 터미널에서 개발 PostGIS와 서버를 실행한다.
# iOS에서는 Xcode 경로를 먼저 지정한다.
export DEVELOPER_DIR=/Applications/Xcode.app/Contents/Developer

flutter test integration_test/live_route_search_test.dart \
  -d <ios-simulator-id> \
  --dart-define-from-file=config/development.local.json \
  --dart-define=API_BASE_URL=http://localhost:8080

flutter test integration_test/live_route_search_test.dart \
  -d <android-emulator-id> \
  --dart-define-from-file=config/development.local.json \
  --dart-define=API_BASE_URL=http://10.0.2.2:8080
```

시뮬레이터의 위치는 미리 서울숲 `위도 37.5445, 경도 127.0374`로 준비한다. 테스트 앱 재설치 시 위치 권한이 초기화될 수 있으므로 설치 후 사용 중 위치 접근을 허용한다. 자동 실행에서는 테스트 시작 후 권한과 위치를 설정했다.

```sh
# iOS Simulator: booted 대신 해당 simulator ID를 사용할 수 있다.
xcrun simctl location booted set 37.5445,127.0374
xcrun simctl privacy booted grant location com.example.igilro

# Android Emulator: 좌표 순서는 경도, 위도다.
adb -s <android-emulator-id> emu geo fix 127.0374 37.5445
adb -s <android-emulator-id> shell pm grant com.example.igilro android.permission.ACCESS_COARSE_LOCATION
adb -s <android-emulator-id> shell pm grant com.example.igilro android.permission.ACCESS_FINE_LOCATION
```

기존 `integration_test/map_location_test.dart`는 Fake Repository로 우회 경로를 구성해 네이티브 렌더링 자체를 검증한다. 실제 HTTP 테스트와 역할을 분리한다. 같은 스타일 URI를 다시 요청해도 재로딩하지 않는 SDK 동작 때문에 기존 테스트가 대기하던 문제를 확인했고, DARK → STANDARD의 실제 스타일 변경으로 복원 검증을 수정했다. 경로 재표시·전체 경로 카메라·입력 삭제 시 경로선 제거를 검사한다.

## 경로 결과 카드와 그늘 표시 추가 검증

장소 검색 클라이언트와 결과 카드 UI를 추가한 뒤 Unit/Widget 229개, 정적 분석·포맷·코드 생성을 확인했다. `live_route_search_test.dart`는 최신 지도 선택 버튼을 사용하도록 갱신했으며 iOS·Android 각 1개가 통과했다. 기존 스타일 복원 테스트의 과거 통과 결과와 구분한다.

- 결과 카드에 `10분 · 801m`, 현재 위치·지도 선택의 출발/도착 이름, OSM 출처가 표시된다.
- 실제 서버 응답 `DATA_UNAVAILABLE`은 ‘그늘 정보 준비 중’으로 표시하고, 평가 기준 시각을 기기 시간으로 변환해 표시한다. 없는 값을 0%로 표시하지 않는다.
- 패널을 펼쳐 지도 높이가 줄어든 뒤에도 모든 경로 좌표·입력 핀이 카메라 범위에 포함되며 핀의 세로 여백을 검사했다. 경로 레이어도 계속 표시된다.
- iOS에서 Flutter 레이아웃 직후 네이티브 지도가 이전 크기를 사용하던 현상을 발견했다. 네이티브 idle 후 한 번 더 카메라를 맞추고, 테스트는 경로와 핀 여백이 맞춰질 때까지 제한된 시간 동안 기다린다.
- 같은 실행에서 지원 지역 밖 422·연결 경로 없음 404·실제 TCP 연결 실패 후 원래 서버로 복구하여 재검색하는 흐름도 통과했다.

그늘 AVAILABLE의 0%·82%, 부분 평가 coverage, 야간·낮은 태양 고도·미지원 시각·미지 상태·정보 누락은 Unit/Widget의 테스트 값으로 검증했다. 실제 서버에 건물 자료를 추가하거나 합성 자료를 서비스 데이터로 적재하지 않았다. 현재 실제 검증의 그늘 상태는 DATA_UNAVAILABLE이다.

카드와 지도 화면은 로컬 `build/screenshots/igilro_route_result-ios.png`, `build/screenshots/igilro_route_result-android.png`에 저장했다.

## 실행 구성과 증거

현재 Mac의 Android Studio에는 다음 로컬 실행 구성을 추가했다. `.idea`의 실행 구성과 토큰 파일은 Git에서 제외한다. 다른 환경에서는 README의 실행 인자로 동일하게 구성한다.

- `igilro (Android Local Server)`: `http://10.0.2.2:8080`
- `igilro (iOS Local Server)`: `http://localhost:8080`

성공·지역 밖·경로 없음·네트워크 오류 화면은 로컬 `build/screenshots/igilro_live_*-ios.png`, `igilro_live_*-android.png`에 저장했다. 원본 HTTP 응답과 실행 로그는 이번 세션의 임시 디렉터리에 보관했다. 공개 토큰·비밀 값은 문서와 소스에 넣지 않았다.

## 검증 범위

이번 결과는 실제 서버와 실제 서울숲 보행 그래프를 사용하는 두 플랫폼의 시뮬레이터 검증이다. 지도 클릭은 SDK의 테스트용 `dispatch`를 사용했고 위치는 네이티브 위치 플러그인과 시뮬레이터 좌표를 사용했다. 실물 휴대전화의 터치·권한 창, LAN 방화벽·배포 HTTPS, 현장 보행 시간과 실제 건물 그늘 품질은 별도 검증 대상이다.
