import 'dart:math';

import 'package:statistics/src/number_extensions.dart';
import 'package:statistics/src/weighted_data.dart';

// Measures of Location

/// Computes the mean of the data set.
num mean({required List<num> data}) {
  return data.isNotEmpty
      ? data.fold<num>(0, (previousValue, element) => previousValue + element) /
          data.length
      : 0;
}

/// Computes the median of the data set.
num median({required List<num> data}) {
  if (data.isEmpty) return 0;

  data.sort();
  var index = ((data.length / 2).round()) - 1;

  return data.length.isEven
      ? mean(data: [data[index], data[index + 1]])
      : data[index];
}

/// Computes the mode of the data set.
num mode({required List<num> data}) {
  num maxValue = 0;
  int maxCount = 0;

  data.forEach((value) {
    var count = 0;

    data.forEach((occurence) {
      if (value == occurence) ++count;
    });

    if (count > maxCount) {
      maxCount = count;
      maxValue = value;
    }
  });

  return maxValue;
}

/// Computes the weighted mean of the data set.
num mean_weighted({required List<WeightedData> data}) {
  return data.isNotEmpty
      ? data.fold<num>(
              0,
              (previous, element) =>
                  previous + (element.value * element.weight)) /
          data.fold<num>(0, (previous, element) => previous + element.weight)
      : 0;
}

/// Computes the geometric mean of the data set.
num mean_geometric({required List<num> data}) {
  var inner = data.fold<num>(1, (previous, element) => previous * element);
  var root = 1 / data.length;
  var result = pow(inner, root);

  return data.isNotEmpty ? result : 0;
}

/// Computes the value at the pth percentile in the data set.
/// The pth argument is specified as a value between 0 and 100.
num percentile({required List<num> data, required num pth}) {
  if (data.isEmpty || pth < 0 || pth > 100) return 0;

  data.sort();

  if (pth == 0) return data[0];

  num locationOfPercentile = (pth / 100) * (data.length + 1);
  var valueAtWhole = data[locationOfPercentile.whole() - 1];
  var valueAtNext = data[locationOfPercentile.whole()];
  var fraction = locationOfPercentile.fraction();

  return valueAtWhole + (fraction * (valueAtNext - valueAtWhole));
}

// Measures of Variability

/// Computes the range of the data set.
num range({required List<num> data}) {
  if (data.isEmpty) return 0;

  data.sort();
  return data.last - data.first;
}

/// Computes the interquartile range of the data set.
num interquartile_range({required List<num> data}) {
  if (data.isEmpty) return 0;

  return percentile(data: data, pth: 75) - percentile(data: data, pth: 25);
}

/// Computes the variance of the data set.
/// Uses sample variance by default, unless otherwise specified.
num variance({
  required List<num> data,
  variance_type type = variance_type.sample,
}) {
  if (data.isEmpty) return 0;

  var meanValue = mean(data: data);
  var numerator = data.fold<num>(
      0, (previous, element) => previous + pow((element - meanValue), 2));
  var denominator =
      type == variance_type.sample ? data.length - 1 : data.length;
  return numerator / denominator;
}

/// Computes the standard deviation of the data set.
/// Uses sample variance by default, unless otherwise specified.
num standard_deviation({
  required List<num> data,
  variance_type type = variance_type.sample,
}) {
  return sqrt(variance(data: data, type: type)).precision(10);
}

/// Computes the coefficient of variation of the data set.
/// Uses sample variance by default, unless otherwise specified.
num coefficient_of_variation({
  required List<num> data,
  variance_type type = variance_type.sample,
}) {
  return data.isNotEmpty
      ? ((standard_deviation(data: data, type: type) / mean(data: data)) * 100)
          .precision(10)
      : 0;
}

enum variance_type {
  sample,
  population,
}
