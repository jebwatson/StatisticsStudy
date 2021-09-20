/// Computes the mean of the data set.
double mean({required List<double> dataSet}) {
  return dataSet.isNotEmpty
      ? dataSet.fold<double>(
              0, (previousValue, element) => previousValue + element) /
          dataSet.length
      : 0;
}

/// Computes the median of the data set.
double median({required List<double> dataSet}) {
  if (dataSet.isEmpty) return 0;

  dataSet.sort();
  var index = ((dataSet.length / 2).round()) - 1;

  return dataSet.length.isEven
      ? mean(dataSet: [dataSet[index], dataSet[index + 1]])
      : dataSet[index];
}

/// Computes the mode of the data set.
double mode({required List<double> dataSet}) {
  double maxValue = 0;
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
