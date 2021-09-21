extension mutation on num {
  num precision(int precision) {
    return double.tryParse(this.toStringAsPrecision(precision)) ?? 0.0;
  }

  num fixed(int decimalPlaces) {
    return double.tryParse(this.toStringAsFixed(decimalPlaces)) ?? 0.0;
  }
}

extension parts on num {
  int whole() {
    return this.floor();
  }

  num fraction() {
    return this % this.whole();
  }
}
