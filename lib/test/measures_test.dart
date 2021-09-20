import 'package:statistics/src/measures.dart';
import 'package:statistics/src/weighted_data.dart';
import 'package:test/test.dart';

void main() {
  group(
    'mean',
    () => {
      test('mean computation, populated', () {
        var expected = 3;
        List<double> dataSet = [5, 4, 3, 2, 1];

        var actual = mean(dataSet: dataSet);

        expect(actual, expected);
      }),
      test('mean computation, unpopulated', () {
        var expected = 0;
        List<double> dataSet = [];

        var actual = mean(dataSet: dataSet);

        expect(actual, expected);
      }),
    },
  );
  group(
    'median',
    () => {
      test('median computation, populated, odd', () {
        var expected = 3;
        List<double> dataSet = [5, 4, 3, 2, 1];

        var actual = median(dataSet: dataSet);

        expect(actual, expected);
      }),
      test('median computation, populated, even', () {
        var expected = 2.5;
        List<double> dataSet = [4, 3, 2, 1];

        var actual = median(dataSet: dataSet);

        expect(actual, expected);
      }),
      test('median computation, unpopulated', () {
        var expected = 0;
        List<double> dataSet = [];

        var actual = median(dataSet: dataSet);

        expect(actual, expected);
      }),
    },
  );
  group(
    'mode',
    () => {
      test('mode computation, populated, one winner', () {
        var expected = 2;
        List<double> dataSet = [2, 1, 2];

        var actual = mode(dataSet: dataSet);

        expect(actual, expected);
      }),
      test('mode computation, populated, two winners', () {
        var expected = 2;
        List<double> dataSet = [2, 1, 2, 1];

        var actual = mode(dataSet: dataSet);

        expect(actual, expected);
      }),
      test('mode computation, unpopulated', () {
        var expected = 0;
        List<double> dataSet = [];

        var actual = mode(dataSet: dataSet);

        expect(actual, expected);
      }),
    },
  );

  group(
    'weighted mean',
    () => {
      test('populated', () {
        var expected = 2.96;
        List<WeightedData> data = [
          WeightedData(weight: 1200, value: 3),
          WeightedData(weight: 500, value: 3.4),
          WeightedData(weight: 2750, value: 2.8),
          WeightedData(weight: 1000, value: 2.9),
          WeightedData(weight: 800, value: 3.25),
        ];

        var actual = weightedMean(data: data);

        expect(actual, expected);
      }),
      test('unpopulated', () {
        var expected = 0;
        List<WeightedData> data = [];

        var actual = weightedMean(data: data);

        expect(actual, expected);
      }),
    },
  );
}
