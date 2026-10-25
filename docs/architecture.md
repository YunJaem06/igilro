# 이길로 Flutter 아키텍처

## 현재 범위

Phase 1은 앱 기반을 구성했고, Phase 2에서 지도와 현재 위치 기능을 추가했다. Phase 3에서는 출발지·도착지의 지도 선택과 핀 표시, 선택 좌표로 기본 도보 경로를 검색하는 API 흐름과 경로선·전체 경로 카메라 조정을 연결했다. 장소명 검색은 UI·API 클라이언트까지 추가했으며 실제 검색 성공은 서버 장소 API 구현 후 검증한다. 기능의 역할이 생기기 전에는 빈 Repository, UseCase, Notifier를 만들지 않는다.

## 현재 파일과 책임

| 위치 | 책임 |
| --- | --- |
| `lib/main.dart` | bootstrap 호출 |
| `app/bootstrap.dart` | Flutter 초기화, 환경 설정 검증, ProviderScope 구성 |
| `app/app.dart` | MaterialApp.router, 한국어 Material 지원, 테마 적용 |
| `app/di/app_providers.dart` | 환경 설정, Dio와 DioClient 생성 및 수명 관리 |
| `app/router/` | 이름을 가진 경로, GoRouter 생성·해제, 오류 경로 복구 |
| `app/theme/app_theme.dart` | 공통 Material 3 밝은 테마와 어두운 테마 |
| `app/pages/home_page.dart` | 지도/위치/경로 입력 View 조립, 위치 성공과 지도 터치를 선택 상태로 연결, Domain 좌표를 지도 렌더링 값으로 변환 |
| `app/widgets/map_search_sheet.dart` | 지도·검색 패널 비율과 드래그·접근성 조절, 스크롤 레이아웃; UI 상태만 보유 |
| `app/di/location_dependencies.dart` | 위치 Repository 구현체, 플랫폼 DataSource와 Mapper 조립 |
| `app/di/route_dependencies.dart` | 경로 검색 Repository 구현체, HTTP DataSource와 Mapper 조립 |
| `app/di/place_dependencies.dart` | 장소 검색 Repository 구현체, HTTP DataSource와 Mapper 조립 |
| `core/config/app_config.dart` | 개발·스테이징·운영 환경과 API 서버 origin 검증 |
| `core/network/dio_client.dart` | JSON 통신 설정, GET/POST, 요청 취소, 통신 예외 변환 |
| `core/network/api_error_dto.dart` | 공통 서버 오류 JSON의 code/requestId 역직렬화 |
| `core/network/network_error_mapper.dart` | HTTP 상태와 Dio 오류를 기술에 독립적인 Failure로 변환 |
| `core/network/api_exception.dart` | DataSource에서 다루는 통신 경계 예외 |
| `core/error/failure.dart` | 불변 오류 값; Dio·Flutter에 의존하지 않음 |
| `core/error/result.dart` | Repository/UseCase의 성공·실패 반환 계약 |
| `core/geo/geo_coordinate.dart` | SDK·플랫폼에 독립적인 공통 좌표 값 |
| `features/map/presentation/state/map_state.dart` | 지도 로딩 상태, 카메라 목표, 현재 위치, 재생성 세션의 불변 값 |
| `features/map/presentation/providers/map_notifier.dart` | 준비/실패/재시도/현재 위치로 이동하는 동기 상태 동작 |
| `features/map/presentation/adapters/mapbox_controller.dart` | SDK 좌표 변환, 명령 순서 보장, 카메라·마커·경로선 제어 |
| `features/map/presentation/widgets/` | 네이티브 지도의 생성/해제, 로딩·실패 화면; 테스트 시 surface 교체 |
| `features/location/domain/` | 위치 값과 접근 계약, 서비스/권한/획득 순서, 오류에 맞는 설정 복구 |
| `features/location/data/` | 주입된 GeolocatorPlatform 호출, 위치 값 검증/변환, 예상 플랫폼 오류 변환 |
| `features/location/presentation/` | AsyncNotifier 상태, 위치 버튼·안내, 설정 복귀 시 재요청 |
| `features/place_search/domain/` | 공급자와 SDK에 독립적인 Place, 검색 계약, 검색어 공백 정규화와 빈 입력 검증 |
| `features/place_search/data/` | 장소 검색 GET, DTO·좌표 검증과 Domain 변환, 독립적인 HTTP 취소 토큰 |
| `features/place_search/presentation/` | 장소 검색 모달 View, 입력 debounce·IME 조합 대기, AsyncNotifier 결과·오류·재시도 |
| `features/route_search/domain/entities/` | 출발·도착 좌표와 선택 출처, 경로 요청·결과, 경로 형상·스냅·환경 평가 값 |
| `features/route_search/domain/usecases/search_route_use_case.dart` | 확정 좌표 검증과 UTC 요청 구성, Repository 호출·취소 |
| `features/route_search/data/` | 경로 HTTP 요청, DTO 역직렬화와 검증·Domain 변환, 요청 취소·오류 변환 |
| `features/route_search/presentation/state/` | 확정된 두 지점과 선택 중인 대상/후보를 구분하는 불변 상태 |
| `features/route_search/presentation/providers/route_selection_notifier.dart` | 선택 시작·미리보기·확정·취소·현재 위치 사용·교환·삭제 |
| `features/route_search/presentation/providers/route_search_notifier.dart` | 명시적 검색, 로딩·성공·실패 상태, 입력 변경 시 취소와 늦은 응답 무시 |
| `features/route_search/presentation/widgets/route_selection_panel.dart` | 선택 입력과 안내, 지도 준비 상태에 따른 선택 확정/두 지점 보기 버튼 |
| `features/route_search/presentation/widgets/route_search_control.dart` | 검색·재시도 동작과 비동기 상태 표시, 결과 카드에 Domain 값 전달 |
| `features/route_search/presentation/widgets/route_result_card.dart` | 시간·거리·출발/도착 이름, 접는 상세 정보와 출처 표시 |
| `features/route_search/presentation/widgets/route_shade_info.dart` | 건물 그늘 비율·평가 가능 범위·평가 기준 시각·상태 안내 |
| `features/route_search/presentation/models/` | 그늘 표시 정책과 비율·시간·거리의 순수 표시 변환 |
| `features/map/presentation/state/map_marker.dart` | 경로 Domain에 의존하지 않는 좌표와 마커 역할의 렌더링 입력 |
| `features/map/presentation/adapters/map_pin_image.dart` | 코드로 그린 출발/도착/선택 핀을 네이티브 annotation 이미지로 변환 |

`*.g.dart`, `*.freezed.dart`는 생성된 파일이며 직접 수정하지 않는다. build.yaml에서 Freezed의 출력 포맷을 활성화한다. 생성 결과와 pubspec.lock을 저장소에 포함한다.

## 기능을 추가할 때의 구조

```text
lib/
  app/                         # 앱 조립과 화면 진입
  core/                        # 공통 기술 코드, 비즈니스 규칙 없음
  features/
    map/
    location/
    place_search/
    route_search/
    route_result/
    route_preference/
      presentation/
        pages/
        widgets/
        providers/             # ViewModel과 기능 의존성 계약
        state/
      domain/
        entities/
        repositories/          # interface
        usecases/
      data/
        datasources/
        dto/
        mappers/
        repositories/          # 구현체
  shared/                      # 둘 이상의 기능이 실제로 공유하는 코드
```

이 구조는 확장 시의 규칙이다. 현재 사용하지 않는 디렉터리는 만들지 않는다. 지도는 SDK 제어를 presentation의 adapter/widget 수명에 묶고, 카메라·선택 같은 순수 상태는 Notifier로 관리한다. 단순 지도 표시만으로 Domain/Data 계층을 억지로 만들지 않는다.

## 의존성과 상태 흐름

```text
View -> Notifier/AsyncNotifier -> UseCase -> Repository interface
                                             ^
                               Repository implementation -> DataSource -> DioClient

서버 JSON -> DTO -> Mapper -> Domain Entity -> UseCase -> immutable state -> View
```

- Domain은 순수 Dart와 공통 오류 계약에만 의존한다. Flutter, Riverpod, Dio, Mapbox, DTO, DataSource를 import하지 않는다.
- Data는 Domain에 의존하고, Presentation은 Domain과 Riverpod에 의존한다. View는 Repository, DataSource, Dio를 직접 호출하지 않는다.
- `app/di`가 기능의 Repository interface에 Data 구현체를 조립한다. 기능 내부는 Domain 타입의 Provider 계약을 정의하고 앱에서 override한다. 기능이 `app/di`를 역참조하지 않는다.
- `core`는 `app`, `features`를 참조하지 않는다. `shared`는 실제 공유하는 순수 모델·UI에만 사용한다.
- 다른 기능의 Data/Notifier 직접 참조를 피한다. 공통 화면 조립은 app이 맡고, 필요한 기능 간 계약은 공개 Domain 타입으로 제한한다.
- 상태를 바꾸는 동작은 Notifier 메서드로 전달한다. 동기는 Notifier, 네트워크 작업은 AsyncNotifier를 사용한다.
- AsyncValue가 loading/error를 표현하면 State에 같은 isLoading/error를 중복 저장하지 않는다. 입력 상태와 검색 결과 상태는 역할에 따라 분리한다.
- UseCase는 경로 검색, 권한을 포함한 현재 위치 획득처럼 의미가 있는 동작 단위로 만든다.

## Riverpod 구성

Phase 1의 appConfigProvider는 bootstrap에서 반드시 override한다. dioProvider가 구성 값을 관찰하고 Dio를 생성하며, ProviderContainer 해제 시 연결을 닫는다. dioClientProvider는 이 Dio를 사용하는 오류 변환 경계다. appRouterProvider도 컨테이너 해제 시 GoRouter를 해제한다.

공통 객체는 앱 수명 동안 유지하므로 keepAlive를 사용한다. 이후 화면 Notifier는 기본 자동 해제를 우선 사용하고, 요청 취소·SDK controller 해제를 각 소유자의 수명에 연결한다. Provider 선언은 불변 의존성 정의이며, 실제 객체와 상태는 컨테이너별로 생성된다.

Phase 2의 locationRepositoryProvider는 bootstrap에서 Data 구현체로 override한다. GetCurrentLocationUseCase가 서비스 → 권한 확인 → 필요 시 요청 → 위치 획득 순서를 소유한다. LocationNotifier는 초기화 시 권한을 요청하지 않고, 버튼 동작을 받아 AsyncValue<LocationFix?>를 갱신한다. AsyncValue가 로딩·오류를 표현하므로 별도 LocationState에 같은 필드를 중복하지 않는다. 진행 중 중복 동작을 막고 해제 후 도착한 응답은 무시한다.

MapNotifier는 SDK 객체를 갖지 않는다. MapboxSurface가 MapboxController를 소유하고 해제하며, 카메라 초기 viewport와 이후 이동 명령을 구분한다. 카메라 revision은 동일 좌표에 대한 재중앙 이동을 지원하고 session은 지도 재시도 시 네이티브 surface를 다시 만든다. 위치와 지도 feature는 서로 import하지 않는다. HomePage가 위치 성공을 MapNotifier 동작으로 연결한다. 지도 로직에 서버 Repository나 의미 없는 UseCase를 만들지 않는다.

RouteSelectionNotifier는 확정된 RouteEndpoints와 선택 중인 candidate를 분리한다. 지도 터치는 후보만 갱신하고 확인 동작이 해당 지점만 확정한다. 취소는 기존 위치를 보존한다. 현재 위치를 획득하는 동안 도착지를 선택해도 도착지 후보가 유지된다. RouteEndpoints가 완전성·동일 좌표 여부를 판단하며, 단순 값 편집을 위한 위임 UseCase는 만들지 않는다. 서버 검색은 별도의 UseCase/Repository/DataSource가 담당한다.

기본 경로 검색은 RouteSearchNotifier → SearchRouteUseCase → RouteRepository → RouteRepositoryImpl → RouteRemoteDataSource → DioClient로 실행한다. UseCase는 확정된 두 좌표의 존재·범위·동일 위치 여부를 확인하고 UTC 출발 시각의 RouteQuery를 구성한다. app/di/route_dependencies.dart가 구현체를 만들고 bootstrap이 기능의 Repository Provider 계약을 override한다. 기능은 app을 import하지 않는다.

RouteMapper는 요청에 walking/fastest와 정의된 필드만 포함하고, 성공 DTO를 경로·스냅·버전·출처·그늘 평가 Entity로 변환한다. GeoJSON의 경도/위도 순서와 필수 구조, 유한 좌표·거리, 정수 시간·개수, 비율 범위와 평가 시각을 검증한다. 선택 좌표는 RouteQuery에 유지하고 실제 경로 끝점과 접근 거리는 RouteSnapping에 별도로 보존한다. 미평가 지표의 null을 0으로 대체하지 않으며 버전 문자열을 해석하지 않는다. 응답의 미지 필드는 허용해 서버 확장을 수용한다.

RouteSearchNotifier는 명시적 버튼 동작에서만 검색한다. 확정 좌표를 관찰하여 변경 시 진행 중 요청과 결과를 정리하고 revision으로 늦은 응답을 무시한다. 지도 후보 미리보기는 확정 좌표를 바꾸지 않으므로 기존 결과를 보존한다. RouteSearchControl은 선택 중에도 구독을 유지하여 패널을 숨겼다는 이유로 결과를 잃지 않는다. 취소는 Domain Repository의 동작으로 노출하고 실제 CancelToken은 Data 계층에만 둔다.

PlaceSearchNotifier는 검색 모달 수명에 묶인 AsyncNotifier다. 빈 입력/조합 중 입력은 AsyncData(null), 대기·요청은 AsyncLoading, 성공은 AsyncData(List<Place>), 실패는 AsyncError로 표현한다. 빈 목록은 검색 성공이므로 초기 상태·404 서비스 미준비와 구분한다. 350ms debounce와 한글 IME 조합 대기, 검색 키로 즉시 요청, 검색어 변경·화면 해제 시 취소, revision 기반 이전 응답 무시를 소유한다. SearchPlacesUseCase는 공백 정규화와 빈 검색어 검증을 담당한다. PlaceRepositoryImpl의 CancelToken은 경로 요청과 별개이며 두 검색이 서로의 요청을 취소하지 않는다.

장소 검색 화면은 View 입력용 모달이므로 app이 showDialog와 Dialog.fullscreen으로 조립한다. 기존 GoRouter의 화면 경로는 유지한다. HomePage는 선택된 Place를 이름·주소·ID·좌표가 있는 RoutePoint로 변환하며 두 feature는 서로의 Notifier/DTO를 import하지 않는다. 검색을 열거나 닫는 동작은 확정 상태를 바꾸지 않고, 결과를 선택할 때 해당 지점만 갱신한다. RouteMapper는 장소 메타데이터를 서버 경로 요청에 넣지 않는다. 지도에서 다시 고르면 새로운 map 출처의 RoutePoint를 만들며 이전 장소 이름을 새 좌표에 재사용하지 않는다.

HomePage는 경로 선택의 좌표·역할을 MapMarker로 변환해 MapCanvas에 전달한다. 지도 feature는 route_search를 import하지 않는다. 확정된 지점 변경은 MapNotifier.framePoints로 연결하며, 후보 위치 변경은 카메라를 이동시키지 않는다. MapboxController는 마커 갱신과 카메라 명령을 분리하고 실제 지도 크기에 맞는 padding으로 두 지점을 맞춘다. Mapbox 3의 TapInteraction.onMap을 네이티브 map 수명에 등록한다. SDK annotation/controller는 순수 상태에 저장하지 않는다.

검색 결과도 HomePage가 조립한다. 성공 결과의 path를 GeoCoordinate 목록인 MapCanvas.routePath로 전달하고 모든 경로 좌표와 입력 핀을 MapNotifier.framePoints에 전달한다. 경로 Domain 모델이나 API DTO를 지도 feature로 넘기지 않는다. 로딩·오류·입력 변경으로 결과가 사라지면 빈 경로를 전달해 이전 선을 제거한다. MapboxController는 전용 PolylineAnnotationManager를 위치·핀보다 먼저 만들고 서버의 스냅 지점 사이 형상만 그린다. 스타일 재로딩은 기존 manager를 제거하고 캐시를 초기화해 같은 경로·마커를 다시 적용한다. MapboxSurface는 프레임 안의 변경을 모아 레이아웃 이후 최신 지도 크기로 SDK 명령을 실행하고, 결과 패널이나 화면 크기 변경 시 전체 범위를 다시 맞춘다.

HomePage는 View 수명에 묶인 ScrollController와 결과 앵커로 성공 시 카드 위치로 스크롤한다. MapSearchSheet는 지도 위를 덮는 대신 지도와 패널에 실제 높이를 배분하여 SDK 출처가 보이게 하고, 손잡이 드래그·탭·접근성 동작으로 높이를 조절한다. 패널 비율과 상세 정보 펼침은 UI 로컬 상태이며 업무 상태에 추가하지 않는다. 지도 선택 중에도 RouteSearchControl의 구독과 기존 결과는 유지한다.

플랫폼 지도의 크기 변경이 Flutter 레이아웃보다 늦게 반영될 수 있어 MapboxSurface는 크기가 바뀐 경우 네이티브 idle 이후 한 번 더 범위를 맞춘다. 일반 지도 이동에는 이 보정을 반복하지 않는다. MapboxController는 작은 지도에서도 핀·라벨을 위한 세로 여백을 확보하고, 아주 작은 화면에서는 가용 높이에 맞춰 여백을 제한한다.

RouteResultCard는 현재 선택 이름의 좌표가 응답 query와 일치할 때만 해당 이름을 사용한다. 이름이 없는 지도 선택·현재 위치는 읽기 쉬운 출처 문구로 표시하고 스냅 좌표·접근 거리는 상세 정보에 둔다. 출처는 상세 영역 밖에서 계속 표시한다. RouteShadeSummary는 Domain의 그늘 상태를 표시 값으로 변환하며 실제 경로 계산·점수 산정은 수행하지 않는다. AVAILABLE·coverage=1·유효한 ratio가 모두 있을 때만 비율을 노출하고, 미평가·미지 상태의 숫자를 추정하지 않는다. 서버 evaluatedAt은 기기 시간으로 변환해 표시하고 평가 기준·추정 한계를 안내한다. DTO·Repository·경로 API 계약은 변경하지 않는다.

## 오류 경계

```text
DioException -> DioClient -> ApiException(Failure)
                               |
                   Data Repository가 catch
                               v
                     Result.failure(Failure)
                               |
                   UseCase -> AsyncNotifier -> View
```

현재 DioClient는 HTTP 오류, 연결 오류, timeout, 취소, 인증서 오류, 깨진 JSON을 변환한다. 서버 code/requestId는 보존하고 서버 message는 화면 문구로 직접 사용하지 않는다. 오류 JSON이 없거나 잘못되어도 HTTP 상태 기반 처리가 동작한다.

이후 Repository는 ApiException과 DTO/Mapper의 데이터 오류를 공통 또는 기능별 Failure로 변환한다. 예상하지 못한 프로그래밍 오류까지 무조건 catch해서 숨기지 않는다. Notifier가 Result.failure를 AsyncValue.error로 바꾸고 Presentation에서 사용자 문구를 선택한다. 취소된 이전 요청은 사용자 오류로 표시하지 않는다. 자동 재시도는 실제 요청의 멱등성과 화면 동작을 검토한 뒤 정한다.

## 테스트

현재 Unit/Widget 테스트는 환경 설정, Dio 오류 경계, 위치 Mapper/Repository/UseCase, Notifier 중복 요청·해제·재시도, 권한 거부 복구, 지도 재생성, 좌표 순서, 화면·라우팅·큰 글꼴을 검증한다. 경로 입력은 선택 확정/취소, 교환/삭제, 동일 위치 검증, 비동기 현재 위치 획득 중 도착지 후보 보존, 지도 로드 실패/재시도와 마커 연결을 검증한다. 외부 서버 호출은 없다. integration_test/map_location_test.dart는 실제 Mapbox 스타일 로드, 위치 획득, SDK dispatch를 통한 네이티브 클릭 이벤트 처리, 도착지 선택·확정과 실제 카메라 영역의 두 좌표 포함을 검증한다. 물리적인 터치 입력과 권한 다이얼로그는 기기에서 별도로 확인한다.

장소 검색 테스트는 실제 Data 계층과 Fake HTTP adapter로 GET query 인코딩·DTO 검증·빈 결과·HTTP 오류·취소를 검증한다. Fake Repository로 공백 정규화, debounce, 한글 조합, 연속 요청·삭제·해제 후 늦은 응답 무시와 재시도를 검증한다. Widget 테스트는 큰 글꼴·키보드·긴 장소명, 이름·주소 표시, 장소 선택과 지도 핀·카메라·경로 검색 연결, 취소 시 기존 경로 보존, 교환·삭제와 지도 선택 복귀를 검증한다. 실제 장소 공급자와의 성공 응답은 서버 구현 후 별도로 검증한다.

기능별로 DTO/Mapper, Repository(Fake DataSource), UseCase(Fake Repository), Notifier(Provider override), Widget 테스트를 추가한다. Mapbox·위치 권한·실제 서버 연결은 기기 Integration Test로 확인한다. 서버의 공간 데이터 계산은 서버 테스트 책임이다.

CI는 잠금 파일 설치, 코드 재생성 및 생성 파일 일치, 포맷, analyze, 테스트, Android debug 빌드를 검사한다. iOS는 현재 로컬 Simulator 빌드로 확인하며 macOS CI는 기능 추가 시 확장한다.

## Native 경계

Android Kotlin은 Flutter 패키지로 해결되지 않는 플랫폼 기능이 있을 때 사용한다. MethodChannel의 호출·타입 변환은 플랫폼 DataSource에 두며, Presentation/Domain에 채널 이름과 플랫폼 타입을 노출하지 않는다.

## 참고

- [Flutter 앱 아키텍처](https://docs.flutter.dev/app-architecture/guide)
- [Riverpod 코드 생성](https://riverpod.dev/docs/concepts/about_code_generation)
- [Freezed](https://pub.dev/packages/freezed)
- [go_router 이름 기반 경로](https://pub.dev/documentation/go_router/latest/topics/Named%20routes-topic.html)
