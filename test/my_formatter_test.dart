import 'package:test/test.dart';
import 'package:findseat/utils/my_formatter.dart';

void main() {
  test('Format time duration to hm', () {
    var result = Duration(seconds: 5640).formatHHmm();
//    print(result);

    expect(result, "01h 34m");
  });
  test('Format decimal', () {
    String result = 1403.formatDecimalThousand();
    print(result);

    expect(result, "1,403");
  });
}
