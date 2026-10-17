# 서버 Codex 전달 내용

아래 내용은 이길로 Flutter의 구성과 서버 연동 요구사항이다. 서버의 기존 파일·아키텍처를 먼저 확인하고 반영해 주세요. 서버 Phase 1을 구축하고, 경로 관련 API는 다음 단계의 계약으로 검토해 주세요.

## Flutter 현재 상태

- 앱 기반: Flutter/Dart, Riverpod 상태관리·DI, go_router, Dio, Freezed/json_serializable.
- API 주소는 빌드 시 `API_BASE_URL`로 주입한다. 서버 origin만 사용하며 `/api/v1`은 기능의 endpoint 경로에 포함한다.
- `APP_ENV`는 development/staging/production이다. 개발 외에는 HTTPS 주소가 필요하다.
- JSON 요청/응답, Accept/Content-Type application/json.
- 연결·송신 timeout 10초, 수신 timeout 30초. 서버는 동기 경로 검색이 이 범위에 들어오는지 측정해 주세요. 장시간 작업이 필요하면 비동기 작업 API를 별도로 합의한다.
- Flutter Phase 2에서 Mapbox 지도와 현재 위치 기능을 연결했다. 현재 앱은 서버 API를 호출하지 않으며 경로 API 연결은 Phase 3이다.
- Phase 3의 출발지/도착지 지도 선택, 현재 위치를 출발지로 사용, 핀 표시·교환·삭제를 구현했다. 앱이 준비한 WGS84 좌표를 이후 경로 검색 요청으로 전달한다. 현재 선택값에는 장소 이름/주소/공급자 ID가 없으며 장소 검색 API 연결 시 추가한다.

## 지금 서버 Phase 1에서 필요한 것

1. Java 21, Kotlin/Spring Boot 기반 실행·테스트 환경과 feature-first 계층 경계.
2. Docker Compose의 PostgreSQL/PostGIS, 환경 변수 기반 DB 설정, Flyway 공간 확장 초기화. Apple Silicon에서 사용할 이미지의 지원 여부를 확인한다.
3. 로컬 서버 주소와 포트(8080 제안), 실행 명령과 필요한 환경 변수 문서.
4. `GET /actuator/health`와 DB 연결 상태 확인. 앱용 업무 API 오류는 아래 공통 JSON 형식으로 처리한다. Actuator의 기본 응답은 별도로 유지해도 된다.
5. Validation, 공통 예외 처리, requestId 추적, OpenAPI 문서.
6. 서버 자체 단위/API/DB 테스트와 CI. 실제 경로·그림자 알고리즘 구현은 다음 단계로 진행한다.

## 공통 오류 계약

앱은 비정상 HTTP 상태와 함께 아래의 **최상위 code/requestId**를 읽는다. HTTP 200 안에 업무 오류를 넣지 않는다.

```json
{
  "code": "INVALID_ROUTE_QUERY",
  "message": "요청을 확인해 주세요.",
  "requestId": "a7b5b44d-32b0-4d45-bb44-b7a3a719ce25"
}
```

code는 안정적인 문자열 식별자, requestId는 서버 로그와 연결할 값이다. message는 선택 사항이며 앱은 화면 문구로 그대로 사용하지 않는다. 필요하면 timestamp, validation details를 추가할 수 있다. 오류도 application/json으로 반환한다.

| HTTP | 오류 코드 제안 | 의미 |
| --- | --- | --- |
| 400 | INVALID_REQUEST / INVALID_ROUTE_QUERY | 형식·범위 등 입력 검증 실패 |
| 422 | OUTSIDE_SUPPORTED_AREA | 요청 좌표가 서비스 지역 밖 |
| 404 | ROUTE_NOT_FOUND | 유효한 좌표지만 연결 가능한 보행 경로 없음 |
| 429 | TOO_MANY_REQUESTS | 요청 제한 |
| 503 | ROUTING_DATA_UNAVAILABLE | 경로 데이터가 준비되지 않음 |
| 500 | INTERNAL_SERVER_ERROR | 예상하지 못한 서버 오류 |

401/403 등도 앱에서 구분한다. 인증 도입 시 계약을 추가한다. 위 업무 코드·상태는 합의 전 제안이며 서버에서 변경이 필요하면 이유와 최종 표를 회신해 주세요.

## 다음 단계: 장소 검색 계약 제안

`GET /api/v1/places/search?query=서울숲`

```json
{
  "places": [
    {
      "id": "provider:place-id",
      "name": "서울숲",
      "address": "서울특별시 성동구",
      "coordinate": {"longitude": 127.0374, "latitude": 37.5445}
    }
  ]
}
```

한국 장소 검색 데이터 공급자는 서버 adapter로 분리하고, 공급자의 응답을 이 앱 계약으로 변환한다. 빈 결과는 places: []로 표현한다. 페이지 처리, 공급자 약관·캐시 정책은 선정 후 문서화한다.

## 다음 단계: 도보 경로 계약 제안

`POST /api/v1/routes/search`

아래 좌표와 수치는 JSON 형식 설명용 예시이며 실제 계산 결과가 아니다.

```json
{
  "origin": {"longitude": 127.0374, "latitude": 37.5445},
  "destination": {"longitude": 127.0430, "latitude": 37.5480},
  "travelMode": "walking",
  "mode": "fastest",
  "departureAt": "2026-10-10T14:00:00+09:00"
}
```

```json
{
  "routes": [
    {
      "id": "route-id",
      "mode": "fastest",
      "geometry": {
        "type": "LineString",
        "coordinates": [[127.0374, 37.5445], [127.0430, 37.5480]]
      },
      "distanceMeters": 1700,
      "durationSeconds": 1320,
      "additionalDurationSeconds": 0,
      "metrics": {
        "shadeRatio": null,
        "quietScore": null,
        "lightingScore": null,
        "trafficSignalCount": null
      }
    }
  ],
  "evaluatedAt": "2026-10-10T05:00:00Z",
  "dataVersion": "dataset-version"
}
```

- 초기에는 fastest 도보 경로부터. shade/sunlight는 환경 계산 단계에서 추가한다.
- 모든 좌표는 WGS84(EPSG:4326). GeoJSON 배열 순서는 `[longitude, latitude]`. 서버 내부의 미터 단위 투영 좌표를 응답에 그대로 넣지 않는다.
- 거리 meters, 시간 seconds. 시간 값은 offset을 포함한 ISO 8601이다. evaluatedAt은 점수를 계산한 기준 시각으로 departureAt과 의미를 일치시킨다.
- shadeRatio/quietScore/lightingScore는 제공 시 0~1로 통일하는 것을 제안한다. 관측·계산되지 않은 값은 null이며 0으로 대체하지 않는다. metric별 데이터 커버리지·산출 방식도 문서화한다.
- additionalDurationSeconds는 같은 조건의 fastest 기준 경로 대비 추가 시간이다. 단순 샘플 상수로 채우지 않는다.
- 경로 없음은 성공의 빈 배열로 숨기지 않고 ROUTE_NOT_FOUND로 표현한다. 성공 routes는 최소 1개, 경로 geometry는 유효한 연결 경로여야 한다.
- 후보 경로 수, id 유효기간, 장소 좌표의 도로 snapping 범위, 지원 지역, 최대 검색 거리와 예상 시간 산출 기준을 합의한다.
- 복수 조건·가중치·그림자 overlay·경로 상세 API는 이후 단계에서 계약을 확장한다.

## 서버 작업 후 알려줄 내용

1. 실행 명령, 서버 포트와 개발 환경 변수.
2. health 확인 결과와 OpenAPI JSON/UI 접근 경로.
3. 공통 오류 JSON 예시와 최종 HTTP/code 표.
4. 위 장소·경로 API 계약의 수용 여부 또는 변경 제안.
5. 첫 지원 지역과 데이터 확보 계획, 기본 도보 경로를 실제로 계산할 수 있는 단계.

Android Emulator에서는 개발 Mac 서버를 `http://10.0.2.2:8080`으로, iOS Simulator에서는 `http://localhost:8080`으로 지정할 예정이다. 실제 기기는 같은 네트워크에서 접근 가능한 개발 Mac 주소를 사용한다. 앱의 로컬 HTTP 허용 설정과 실제 통신 검증은 API 연결 단계에서 수행한다. Flutter native 앱 연결에는 웹 CORS 설정이 필수는 아니며 웹 지원은 별도로 검토한다.
