import 'dart:typed_data';

import 'package:dio/dio.dart';

final class FakeHttpClientAdapter implements HttpClientAdapter {
  FakeHttpClientAdapter(this.handle);

  final ResponseBody Function(RequestOptions options) handle;
  final requests = <RequestOptions>[];
  bool isClosed = false;

  @override
  Future<ResponseBody> fetch(
    RequestOptions options,
    Stream<Uint8List>? requestStream,
    Future<void>? cancelFuture,
  ) async {
    requests.add(options);
    return handle(options);
  }

  @override
  void close({bool force = false}) => isClosed = true;
}

ResponseBody jsonResponse(String body, {int status = 200}) =>
    ResponseBody.fromString(
      body,
      status,
      headers: {
        Headers.contentTypeHeader: [Headers.jsonContentType],
      },
    );
