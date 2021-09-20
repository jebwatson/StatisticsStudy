import 'package:statistics/src/weighted_data.dart';

/// Computes the mean of the data set.
num mean({required List<num> dataSet}) {
  return dataSet.isNotEmpty
      ? dataSet.fold<num>(
              0, (previousValue, element) => previousValue + element) /
          dataSet.length
      : 0;
}

/// Computes the median of the data set.
num median({required List<num> dataSet}) {
  if (dataSet.isEmpty) return 0;

  dataSet.sort();
  var index = ((dataSet.length / 2).round()) - 1;

  return dataSet.length.isEven
      ? mean(dataSet: [dataSet[index], dataSet[index + 1]])
      : dataSet[index];
}

/// Computes the mode of the data set.
num mode({required List<num> dataSet}) {
  num maxValue = 0;
  int maxCount = 0;

  dataSet.forEach((value) {
    var count = 0;

    dataSet.forEach((occurence) {
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
num weightedMean({required List<WeightedData> data}) {
  var numerator = data.fold<num>(
      0, (previous, element) => previous + (element.value * element.weight));
  var denominator =
      data.fold<num>(0, (previous, element) => previous + element.weight);
  return data.isNotEmpty ? numerator / denominator : 0;
}
