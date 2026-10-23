# 서버 Codex 전달 내용

아래 내용은 이길로 Flutter의 구성과 서버 연동 계약이다. 2026-10-19에 공유된 서버 API 계약과 Phase 2/3 성공 응답 예시를 기준으로 기본 도보 경로 요청을 앱에 연결했다. 초기 서버 기반 구성 요구사항은 기록으로 남기고 현재 구현 범위와 최종 경로 응답 필드를 함께 정리한다.

## Flutter 현재 상태

- 앱 기반: Flutter/Dart, Riverpod 상태관리·DI, go_router, Dio, Freezed/json_serializable.
- API 주소는 빌드 시 `API_BASE_URL`로 주입한다. 서버 origin만 사용하며 `/api/v1`은 기능의 endpoint 경로에 포함한다.
- `APP_ENV`는 development/staging/production이다. 개발 외에는 HTTPS 주소가 필요하다.
- JSON 요청/응답, Accept/Content-Type application/json.
- 연결·송신 timeout 10초, 수신 timeout 30초. 서버는 동기 경로 검색이 이 범위에 들어오는지 측정해 주세요. 장시간 작업이 필요하면 비동기 작업 API를 별도로 합의한다.
- Flutter Phase 2에서 Mapbox 지도와 현재 위치 기능을 연결했다. Phase 3에서 선택 좌표로 walking/fastest 경로 API를 호출하고 시간·거리·스냅 위치·접근 거리·출처를 표시한다. 응답 geometry의 전체 좌표를 지도 경로선으로 표시하고 전체 경로·입력 핀이 보이도록 카메라를 조정한다. 입력 핀과 경로 끝점 사이에 접근선을 만들어 추가하지 않는다.
- Phase 3의 출발지/도착지 지도 선택, 현재 위치를 출발지로 사용, 핀 표시·교환·삭제를 구현했다. 앱이 준비한 WGS84 좌표를 경로 검색 요청으로 전달한다. 현재 선택값에는 장소 이름/주소/공급자 ID가 없으며 장소 검색 API 연결 시 추가한다.

## 초기 서버 Phase 1 구성 요구사항 기록

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
  "requestId": "a7b5b44d-32b0-4d45-bb44-b7a3a719ce25",
  "timestamp": "2026-10-10T05:00:00Z",
  "errors": []
}
```

code는 안정적인 문자열 식별자, requestId는 서버 로그와 X-Request-Id 헤더를 연결하는 UUID다. 서버의 진단용 message는 화면 문구로 그대로 사용하지 않고 HTTP 상태와 code로 문구를 결정한다. 서버는 UTC timestamp와 검증 상세 errors를 제공하며 검증 상세가 없으면 빈 배열이다. 앱 DTO는 code/requestId를 사용하고 나머지 필드와 추가 응답 필드는 허용한다. 오류도 application/json으로 반환한다.

| HTTP | 오류 코드 | 의미 |
| --- | --- | --- |
| 400 | INVALID_REQUEST / INVALID_ROUTE_QUERY | 형식·범위 등 입력 검증 실패 |
| 422 | OUTSIDE_SUPPORTED_AREA | 요청 좌표가 서비스 지역 밖 |
| 404 | ROUTE_NOT_FOUND | 유효한 좌표지만 연결 가능한 보행 경로 없음 |
| 429 | TOO_MANY_REQUESTS | 향후 요청 제한 도입 시 사용; 현재 서버의 제한 기능은 미구현 |
| 503 | ROUTING_DATA_UNAVAILABLE | 경로 데이터가 준비되지 않음 |
| 500 | INTERNAL_SERVER_ERROR | 예상하지 못한 서버 오류 |

401/403 등도 앱에서 구분한다. 인증 도입 시 계약을 추가한다. 경로 업무 코드는 서버의 최종 계약으로 확인했으며, 모르는 URL의 404 `NOT_FOUND`와 검색 실패인 404 `ROUTE_NOT_FOUND`를 구분한다. 일반 요청 형식 오류는 400 `INVALID_REQUEST`, 앱용 상태 API의 공간 DB 장애는 503 `SERVICE_UNAVAILABLE`이다. 상태 확인 endpoint는 `GET /api/v1/health`이며 Actuator의 표준 응답과 구분한다.

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

## 연결한 도보 경로 계약

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
  "dataVersion": "dataset-version",
  "timeModelVersion": "time-model-version",
  "routingModelVersion": "routing-model-version",
  "baselineDurationSeconds": 1320,
  "snapping": {
    "origin": {
      "coordinate": {"longitude": 127.0374, "latitude": 37.5445},
      "distanceMeters": 0
    },
    "destination": {
      "coordinate": {"longitude": 127.0430, "latitude": 37.5480},
      "distanceMeters": 0
    }
  },
  "attribution": "© OpenStreetMap contributors"
}
```

- 초기에는 fastest 도보 경로부터. shade/sunlight는 환경 계산 단계에서 추가한다.
- 모든 좌표는 WGS84(EPSG:4326). GeoJSON 배열 순서는 `[longitude, latitude]`. 서버 내부의 미터 단위 투영 좌표를 응답에 그대로 넣지 않는다.
- 거리 meters, 시간 seconds. departureAt은 offset을 포함한 RFC 3339이며 앱은 UTC Z로 보낸다. evaluatedAt은 같은 순간의 출발·평가 기준 시각을 UTC Z로 응답하며 응답 생성 시각이 아니다.
- shadeRatio/quietScore/lightingScore는 제공 시 0~1이다. 관측·계산되지 않은 값은 null이며 0으로 대체하지 않는다. trafficSignalCount는 정수 개수다. 현재 서버는 건물 그늘 평가 조건을 만족할 때 shadeRatio만 제공하며 나머지 세 지표는 null이다.
- additionalDurationSeconds는 같은 조건의 fastest 기준 경로 대비 추가 시간이다. 단순 샘플 상수로 채우지 않는다.
- 경로 없음은 성공의 빈 배열로 숨기지 않고 ROUTE_NOT_FOUND로 표현한다. 성공 routes는 최소 1개, 경로 geometry는 유효한 연결 경로여야 한다.
- 현재 walking/fastest 경로 한 개를 반환한다. 서울숲 pilot 범위는 [서쪽 127.027, 남쪽 37.533, 동쪽 127.055, 북쪽 37.558]이며 50m 이내 보행 구간의 후보를 탐색한다. 보행 1.4m/s·계단 0.9m/s의 정적 시간 모델이고 신호 대기는 포함하지 않는다. 경로 ID는 응답 안에서만 식별하며 상세 조회·저장은 미지원이다.
- 복수 조건·가중치·그림자 overlay·경로 상세 API는 이후 단계에서 계약을 확장한다.

최종 서버 계약에서는 거리·시간이 스냅된 보행로 두 지점 사이의 경로 기준이다. 입력 핀에서 보행로까지의 접근 거리는 포함하지 않는다. 앱은 선택 좌표와 실제 경로 끝점·접근 거리를 분리하고 OSM 출처를 표시한다. 경로 ID는 응답 내 식별자로만 사용하며 상세 조회를 요청하지 않는다. 현재 지원 지역은 서울숲 pilot이고 장소 검색은 경로 API 연결의 선행 조건이 아니다.

`routes[].shadeEvaluation`은 nullable 확장 객체다. status, modelVersion과 nullable coverage/dataVersion/attribution/solarAltitudeDegrees를 보존한다. AVAILABLE과 전체 coverage=1일 때만 shadeRatio를 제공하고 DATA_UNAVAILABLE/INCOMPLETE_COVERAGE/NIGHT/LOW_SUN/UNSUPPORTED_TIME에서는 null이다. 건물 버전·출처는 최상위 보행 그래프 버전·OSM 출처와 구분한다. 현재 클라이언트는 이 데이터를 보존하되 그늘 모드·점수 UI는 추가하지 않는다. 상태가 미지 값이면 unknown으로 유지하고 유효한 기본 경로를 수용한다.

DTO 테스트는 서버에서 공유한 [합성 fixture HTTP 성공 응답](../test/fixtures/route_search_response.json)을 사용한다. 이는 실제 서울숲 스냅샷의 경로 결과를 고정 반환하는 기능이 아니다. 미지 응답 필드를 허용하되 요청에는 정의된 필드만 보낸다.

## 서버 작업 후 알려줄 내용

1. 실행 명령, 서버 포트와 개발 환경 변수.
2. health 확인 결과와 OpenAPI JSON/UI 접근 경로.
3. 공통 오류 JSON 예시와 최종 HTTP/code 표.
4. 위 장소·경로 API 계약의 수용 여부 또는 변경 제안.
5. 첫 지원 지역과 데이터 확보 계획, 기본 도보 경로를 실제로 계산할 수 있는 단계.

Android Emulator에서는 호스트 개발 서버를 `http://10.0.2.2:8080`으로, iOS Simulator에서는 `http://localhost:8080`으로 지정한다. 실제 기기는 같은 네트워크에서 접근 가능한 개발 서버 주소를 사용한다. Android debug HTTP 허용과 iOS 로컬 네트워크 설정을 추가했다. 실제 서버·기기 통합 검증은 남아 있으며, 2026-10-23 Windows의 Unit/Widget 테스트 177개와 정적 분석·포맷 검사는 통과했다. Flutter native 앱 연결에는 웹 CORS 설정이 필수는 아니며 웹 지원은 별도로 검토한다.
