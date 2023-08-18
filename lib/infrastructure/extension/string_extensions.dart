extension StringExtension on String {
  (String, String) splitByFirstOccurrence(String separator) {
    int separatorPosition = indexOf(separator);
    if (separatorPosition == -1) {
      return (this, '');
    }
    return (
      substring(0, separatorPosition),
      substring(separatorPosition + separator.length)
    );
  }
}
