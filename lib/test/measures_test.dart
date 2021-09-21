import 'package:statistics/src/measures.dart';
import 'package:statistics/src/weighted_data.dart';
import 'package:statistics/src/number_extensions.dart';
import 'package:test/test.dart';

void main() {
  group(
    'mean',
    () => {
      test('populated', () {
        var expected = 3;
        List<double> dataSet = [5, 4, 3, 2, 1];

        var actual = mean(data: dataSet);

        expect(actual, expected);
      }),
      test('unpopulated', () {
        var expected = 0;
        List<double> dataSet = [];

        var actual = mean(data: dataSet);

        expect(actual, expected);
      }),
    },
  );
  group(
    'median',
    () => {
      test('populated, odd', () {
        var expected = 3;
        List<double> dataSet = [5, 4, 3, 2, 1];

        var actual = median(data: dataSet);

        expect(actual, expected);
      }),
      test('populated, even', () {
        var expected = 2.5;
        List<double> dataSet = [4, 3, 2, 1];

        var actual = median(data: dataSet);

        expect(actual, expected);
      }),
      test('unpopulated', () {
        var expected = 0;
        List<double> dataSet = [];

        var actual = median(data: dataSet);

        expect(actual, expected);
      }),
    },
  );
  group(
    'mode',
    () => {
      test('populated, one winner', () {
        var expected = 2;
        List<double> dataSet = [2, 1, 2];

        var actual = mode(data: dataSet);

        expect(actual, expected);
      }),
      test('populated, two winners', () {
        var expected = 2;
        List<double> dataSet = [2, 1, 2, 1];

        var actual = mode(data: dataSet);

        expect(actual, expected);
      }),
      test('unpopulated', () {
        var expected = 0;
        List<double> dataSet = [];

        var actual = mode(data: dataSet);

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

        var actual = mean_weighted(data: data);

        expect(actual, expected);
      }),
      test('unpopulated', () {
        var expected = 0;
        List<WeightedData> data = [];

        var actual = mean_weighted(data: data);

        expect(actual, expected);
      }),
    },
  );

  group(
    'geometric mean',
    () => {
      test('populated', () {
        var expected = 1.029275;
        List<num> data = [
          0.779,
          1.287,
          1.109,
          1.049,
          1.158,
          1.055,
          0.630,
          1.265,
          1.151,
          1.021,
        ];

        var actual = mean_geometric(data: data).fixed(6);

        expect(actual, expected);
      }),
      test('unpopulated', () {
        var expected = 0;
        List<num> data = [];

        var actual = mean_geometric(data: data);

        expect(actual, expected);
      }),
    },
  );

  group(
    'percentile',
    () => {
      test('populated, valid p value', () {
        var expected = 4082.0;
        List<num> data = [
          3850,
          3950,
          4050,
          3880,
          3755,
          3710,
          3890,
          4130,
          3940,
          4325,
          3920,
          3880,
        ];

        var actual = percentile(data: data, pth: 80);

        expect(actual, expected);
      }),
      test('populated, p value > 100', () {
        var expected = 0;
        List<num> data = [
          3850,
          3950,
          4050,
          3880,
          3755,
          3710,
          3890,
          4130,
          3940,
          4325,
          3920,
          3880,
        ];

        var actual = percentile(data: data, pth: 101);

        expect(actual, expected);
      }),
      test('populated, p value < 0', () {
        var expected = 0;
        List<num> data = [
          3850,
          3950,
          4050,
          3880,
          3755,
          3710,
          3890,
          4130,
          3940,
          4325,
          3920,
          3880,
        ];

        var actual = percentile(data: data, pth: -1);

        expect(actual, expected);
      }),
      test('populated, p value == 0', () {
        var expected = 3710;
        List<num> data = [
          3850,
          3950,
          4050,
          3880,
          3755,
          3710,
          3890,
          4130,
          3940,
          4325,
          3920,
          3880,
        ];

        var actual = percentile(data: data, pth: 0);

        expect(actual, expected);
      }),
      test('unpopulated', () {
        var expected = 0;
        List<num> data = [];

        var actual = percentile(data: data, pth: 80);

        expect(actual, expected);
      }),
    },
  );

  group(
    'range',
    () => {
      test('populated', () {
        var expected = 2;
        List<num> data = [
          2,
          3,
          4,
        ];

        var actual = range(data: data);

        expect(actual, expected);
      }),
      test('unpopulated', () {
        var expected = 0;
        List<num> data = [];

        var actual = range(data: data);

        expect(actual, expected);
      }),
    },
  );

  group(
    'interquartile range',
    () => {
      test('populated', () {
        var expected = 167.5;
        List<num> data = [
          3850,
          3950,
          4050,
          3880,
          3755,
          3710,
          3890,
          4130,
          3940,
          4325,
          3920,
          3880,
        ];

        var actual = interquartile_range(data: data);

        expect(actual, expected);
      }),
      test('unpopulated', () {
        var expected = 0;
        List<num> data = [];

        var actual = interquartile_range(data: data);

        expect(actual, expected);
      }),
    },
  );

  group(
    'variance',
    () => {
      test('populated, population', () {
        var expected = 51.2;
        List<num> data = [
          46,
          54,
          42,
          46,
          32,
        ];

        var actual = variance(data: data, type: variance_type.population);

        expect(actual, expected);
      }),
      test('populated, sample', () {
        var expected = 64;
        List<num> data = [
          46,
          54,
          42,
          46,
          32,
        ];

        var actual = variance(data: data, type: variance_type.sample);

        expect(actual, expected);
      }),
      test('populated, implied', () {
        var expected = 64;
        List<num> data = [
          46,
          54,
          42,
          46,
          32,
        ];

        var actual = variance(data: data);

        expect(actual, expected);
      }),
      test('unpopulated', () {
        var expected = 0;
        List<num> data = [];

        var actual = variance(data: data);

        expect(actual, expected);
      }),
    },
  );

  group(
    'standard deviation',
    () => {
      test('populated, population', () {
        var expected = 7.155417528;
        List<num> data = [
          46,
          54,
          42,
          46,
          32,
        ];

        var actual =
            standard_deviation(data: data, type: variance_type.population);

        expect(actual, expected);
      }),
      test('populated, sample', () {
        var expected = 8;
        List<num> data = [
          46,
          54,
          42,
          46,
          32,
        ];

        var actual = standard_deviation(data: data, type: variance_type.sample);

        expect(actual, expected);
      }),
      test('populated, implied', () {
        var expected = 8;
        List<num> data = [
          46,
          54,
          42,
          46,
          32,
        ];

        var actual = standard_deviation(data: data);

        expect(actual, expected);
      }),
      test('unpopulated', () {
        var expected = 0;
        List<num> data = [];

        var actual = standard_deviation(data: data);

        expect(actual, expected);
      }),
    },
  );

  group(
    'coefficient of variation',
    () => {
      test('populated, population', () {
        var expected = 16.26231256;
        List<num> data = [
          46,
          54,
          42,
          46,
          32,
        ];

        var actual = coefficient_of_variation(
            data: data, type: variance_type.population);

        expect(actual, expected);
      }),
      test('populated, sample', () {
        var expected = 18.18181818;
        List<num> data = [
          46,
          54,
          42,
          46,
          32,
        ];

        var actual =
            coefficient_of_variation(data: data, type: variance_type.sample);

        expect(actual, expected);
      }),
      test('populated, implied', () {
        var expected = 18.18181818;
        List<num> data = [
          46,
          54,
          42,
          46,
          32,
        ];

        var actual = coefficient_of_variation(data: data);

        expect(actual, expected);
      }),
      test('unpopulated', () {
        var expected = 0;
        List<num> data = [];

        var actual = coefficient_of_variation(data: data);

        expect(actual, expected);
      }),
    },
  );
}
