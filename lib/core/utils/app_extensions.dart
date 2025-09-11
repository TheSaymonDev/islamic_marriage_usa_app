extension HasValueExtension on dynamic {
  bool get hasValue => this?.toString().trim().isNotEmpty ?? false;
}
