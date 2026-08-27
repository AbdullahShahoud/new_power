import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:new_power/core/networking/api_error_handler.dart';

/// `ApiErrorHandler` sanitizes the server's `message` **and the app then
/// renders that string to the user** — every feature Bloc passes
/// `error.message` straight into the UI. So the sanitizer has two jobs that
/// pull against each other: strip anything genuinely sensitive, and leave
/// ordinary business copy alone.
///
/// It used to fail the second job badly. These tests pin both halves.
ApiErrorHandler _handler = ApiErrorHandler();

String _sanitizedMessageFor(String serverMessage) {
  final error = DioException(
    requestOptions: RequestOptions(path: '/projects/x'),
    type: DioExceptionType.badResponse,
    response: Response(
      requestOptions: RequestOptions(path: '/projects/x'),
      statusCode: 409,
      data: {
        'success': false,
        'message': serverMessage,
        'error': {'code': 'CONFLICT', 'statusCode': 409},
      },
    ),
  );
  return ApiErrorHandler.handle(error).message ?? '';
}

void main() {
  // Referenced so the unused-field lint stays quiet if the handler is ever
  // made instantiable; the API under test is static.
  _handler.toString();

  group('sanitizer preserves ordinary business copy', () {
    // The regression that motivated this file: these verbs were replaced
    // with "[sql]" by a keyword filter, case-insensitively, in text shown
    // on screen.
    const sqlishButOrdinary = [
      'You cannot update a confirmed outcome',
      'This project was created by another representative',
      'You cannot delete an activity that has been synced',
      'Select a building type before continuing',
      'No results from the selected territory',
      'The table of contacts is empty',
      'Insert the manager code to continue',
      'Drop the pin inside your own territory',
      'Alter requests are not permitted at this stage',
    ];

    for (final message in sqlishButOrdinary) {
      test('"$message" survives unchanged', () {
        expect(_sanitizedMessageFor(message), message);
      });
    }

    test('a slash inside prose is not mistaken for a filesystem path', () {
      expect(
        _sanitizedMessageFor('Owner/Manager approval is required'),
        'Owner/Manager approval is required',
      );
      expect(
        _sanitizedMessageFor('Support is available 24/7'),
        'Support is available 24/7',
      );
    });
  });

  group('sanitizer still masks what matters', () {
    test('passwords are masked', () {
      expect(_sanitizedMessageFor('login failed password: hunter2'),
          contains('***MASKED***'));
      expect(_sanitizedMessageFor('login failed password: hunter2'),
          isNot(contains('hunter2')));
    });

    test('bearer tokens are masked', () {
      final out = _sanitizedMessageFor(
        'rejected with Authorization: "Bearer eyJhbGciOiJIUzI1NiJ9.abc"',
      );
      expect(out, isNot(contains('eyJhbGciOiJIUzI1NiJ9')));
    });

    test('device ids are masked', () {
      final out = _sanitizedMessageFor(
        'mismatch for "deviceId":"9f2c4a7b1e" on this request',
      );
      expect(out, isNot(contains('9f2c4a7b1e')));
    });

    test('real absolute paths are still removed', () {
      expect(
        _sanitizedMessageFor('failed at /var/www/app/handlers/project.js'),
        contains('[path]'),
      );
      expect(
        _sanitizedMessageFor(r'failed at C:\srv\app\handler.js'),
        contains('[path]'),
      );
    });

    test('messages are capped so a huge body cannot flood the UI', () {
      final long = 'a' * 400;
      expect(_sanitizedMessageFor(long).length, lessThanOrEqualTo(153));
    });
  });

  group('5xx detail is never exposed', () {
    test('a 500 returns a generic message regardless of body', () {
      final error = DioException(
        requestOptions: RequestOptions(path: '/projects'),
        type: DioExceptionType.badResponse,
        response: Response(
          requestOptions: RequestOptions(path: '/projects'),
          statusCode: 500,
          data: {'message': 'ORA-00933: SQL command not properly ended'},
        ),
      );
      final result = ApiErrorHandler.handle(error);
      expect(result.code, 'SERVER_ERROR');
      expect(result.message, isNot(contains('ORA-00933')));
    });
  });
}
