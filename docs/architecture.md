# 이길로 Flutter 아키텍처

## 현재 범위

Phase 1은 앱 조립, 라우팅, 테마, 환경 설정, 통신 오류 경계, 코드 생성과 테스트를 구성한다. 지도, 위치, 장소 검색, 경로 검색 기능은 다음 단계에서 추가한다. 기능의 역할이 생기기 전에는 빈 Repository, UseCase, Notifier를 만들지 않는다.

## 현재 파일과 책임

| 위치 | 책임 |
| --- | --- |
| `lib/main.dart` | bootstrap 호출 |
| `app/bootstrap.dart` | Flutter 초기화, 환경 설정 검증, ProviderScope 구성 |
| `app/app.dart` | MaterialApp.router, 한국어 Material 지원, 테마 적용 |
| `app/di/app_providers.dart` | 환경 설정, Dio와 DioClient 생성 및 수명 관리 |
| `app/router/` | 이름을 가진 경로, GoRouter 생성·해제, 오류 경로 복구 |
| `app/theme/app_theme.dart` | 공통 Material 3 밝은 테마와 어두운 테마 |
| `app/pages/home_page.dart` | 초기 앱 화면; 네트워크와 비즈니스 로직 없음 |
| `core/config/app_config.dart` | 개발·스테이징·운영 환경과 API 서버 origin 검증 |
| `core/network/dio_client.dart` | JSON 통신 설정, GET/POST, 요청 취소, 통신 예외 변환 |
| `core/network/api_error_dto.dart` | 공통 서버 오류 JSON의 code/requestId 역직렬화 |
| `core/network/network_error_mapper.dart` | HTTP 상태와 Dio 오류를 기술에 독립적인 Failure로 변환 |
| `core/network/api_exception.dart` | DataSource에서 다루는 통신 경계 예외 |
| `core/error/failure.dart` | 불변 오류 값; Dio·Flutter에 의존하지 않음 |
| `core/error/result.dart` | 향후 Repository/UseCase의 성공·실패 반환 계약 |

`*.g.dart`, `*.freezed.dart`는 생성된 파일이며 직접 수정하지 않는다. build.yaml에서 Freezed의 출력 포맷을 활성화한다. 생성 결과와 pubspec.lock을 저장소에 포함한다.

## 기능을 추가할 때의 구조

```text
lib/
  app/                         # 앱 조립과 화면 진입
  core/                        # 공통 기술 코드, 비즈니스 규칙 없음
  features/
    map/
    location/
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

현재 테스트는 환경 설정·포트 유효성, 실제 Dio 파이프라인의 가짜 HTTP adapter, 오류 변환, Provider override와 해제, 화면 진입·경로 복구·작은 화면의 큰 글꼴을 검증한다. 외부 서버 호출은 없다.

기능별로 DTO/Mapper, Repository(Fake DataSource), UseCase(Fake Repository), Notifier(Provider override), Widget 테스트를 추가한다. Mapbox·위치 권한·실제 서버 연결은 기기 Integration Test로 확인한다. 서버의 공간 데이터 계산은 서버 테스트 책임이다.

CI는 잠금 파일 설치, 코드 재생성 및 생성 파일 일치, 포맷, analyze, 테스트, Android debug 빌드를 검사한다. iOS는 현재 로컬 Simulator 빌드로 확인하며 macOS CI는 기능 추가 시 확장한다.

## Native 경계

Android Kotlin은 Flutter 패키지로 해결되지 않는 플랫폼 기능이 있을 때 사용한다. MethodChannel의 호출·타입 변환은 플랫폼 DataSource에 두며, Presentation/Domain에 채널 이름과 플랫폼 타입을 노출하지 않는다.

## 참고

- [Flutter 앱 아키텍처](https://docs.flutter.dev/app-architecture/guide)
- [Riverpod 코드 생성](https://riverpod.dev/docs/concepts/about_code_generation)
- [Freezed](https://pub.dev/packages/freezed)
- [go_router 이름 기반 경로](https://pub.dev/documentation/go_router/latest/topics/Named%20routes-topic.html)
