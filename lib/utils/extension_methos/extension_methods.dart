import 'dart:ui';

import 'package:brasil_fields/brasil_fields.dart';
import 'package:intl/intl.dart';

extension StringExtension on String {
  String removeSpecialCharacters() {
    return replaceAll(RegExp(r'(\W+)'), '');
  }

  double currencyToDouble() {
    if (isEmpty) return 0;
    return double.parse(replaceAll(RegExp(r'[^0-9]'), '')) / 100;
  }

  String? formatCPF() {
    if (!UtilBrasilFields.isCPFValido(this)) return null;
    return UtilBrasilFields.obterCpf(this);
  }

  String? formatCNPJ() {
    if (!UtilBrasilFields.isCNPJValido(this)) return null;
    return UtilBrasilFields.obterCnpj(this);
  }

  String formatPhone() {
    if (isEmpty) return 'Não informado';
    return UtilBrasilFields.obterTelefone(this);
  }

  String? formatCep() {
    if (isEmpty) return null;
    return UtilBrasilFields.obterCep(this);
  }

  String? onlyDigits() {
    if (isEmpty) return null;
    return replaceAll(RegExp(r'[^0-9]'), '');
  }

  bool get isValidPhone {
    if (isEmpty) return false;
    return length >= 10;
  }

  bool get isEmail {
    return RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(this);
  }

  String removeDiacritics() {
    var diacritics =
        'ÀÁÂÃÄÅàáâãäåÒÓÔÕÕÖØòóôõöøÈÉÊËĚèéêëěðČÇçčÐĎďÌÍÎÏìíîïĽľÙÚÛÜŮùúûüůŇÑñňŘřŠšŤťŸÝÿýŽž';
    var nonDiacritics =
        'AAAAAAaaaaaaOOOOOOOooooooEEEEEeeeeeeCCccDDdIIIIiiiiLlUUUUUuuuuuNNnnRrSsTtYYyyZz';

    return splitMapJoin('',
        onNonMatch: (char) => char.isNotEmpty && diacritics.contains(char)
            ? nonDiacritics[diacritics.indexOf(char)]
            : char);
  }

  String onlyNumbers() {
    return replaceAll(RegExp(r'[^0-9]'), '');
  }

  String uriEnconded() {
    return Uri.encodeFull(this);
  }

  int toInt() {
    return int.tryParse(this) ?? 0;
  }

  double toDouble() {
    return double.tryParse(this) ?? 0;
  }

  String timeToHuman() {
    final split = this.split(':');
    final duration = Duration(
        hours: int.parse(split[0]),
        minutes: int.parse(split[1]),
        seconds: int.parse(split[2]));
    final hours = duration.inHours;
    final minutes = duration.inMinutes.remainder(60);
    final seconds = duration.inSeconds.remainder(60);

    if (hours > 0 && minutes > 0 && seconds > 0) {
      return '${hours}h e ${minutes}m';
    } else if (hours > 0 && minutes > 0 && seconds == 0) {
      return '${hours}h e ${minutes}m';
    } else if (hours == 0 && minutes > 0 && seconds > 0) {
      return '${minutes}m e ${seconds}s';
    } else if (hours == 0 && minutes == 0 && seconds > 0) {
      return '${seconds}s';
    }

    return '-';
  }

  String maxLength(int maxLength) {
    if (length > maxLength) {
      return substring(0, maxLength);
    } else {
      return this;
    }
  }
}

extension DoubleExtension on double {
  String formatCurrency() {
    return UtilBrasilFields.obterReal(this);
  }

  String format({
    int decimalPlaces = 2,
    bool showOnlyIntegerIfPossible = false,
  }) {
    if (showOnlyIntegerIfPossible && this % 1 == 0) {
      return toInt().toString();
    }
    return UtilBrasilFields.obterReal(this,
        decimal: decimalPlaces, moeda: false);
  }

  int toCents() {
    return (this * 100).toInt();
  }

  int toThousands() {
    return (this * 1000).toInt();
  }
}

extension IntExtension on int {
  double fromCents() {
    return this / 100;
  }

  double fromThousands() {
    return this / 1000;
  }

  String toBadgeCount() {
    if (this > 9) return '9+';
    return '$this';
  }

  DateTime timestampToDate() {
    if (toString().length == 10) {
      // Caso o timestamp seja em segundos converte para milisegundos
      return DateTime.fromMillisecondsSinceEpoch(this * 1000, isUtc: true)
          .toLocal();
    }

    return DateTime.fromMillisecondsSinceEpoch(this, isUtc: true).toLocal();
  }

  String format() {
    return NumberFormat.decimalPatternDigits(locale: 'pt_BR', decimalDigits: 0)
        .format(this)
        .toString();
  }

  int secondsToMinutes() {
    return this ~/ 60;
  }
}

extension NullableStringExtension on String? {
  bool get isNotNullAndIsNotEmpty {
    if (this == null) return false;

    return this!.isNotEmpty;
  }

  bool get isNullOrEmpty {
    if (this == null) return true;

    return this!.isEmpty;
  }
}

extension DateTimeExtension on DateTime {
  // ignore: unnecessary_string_escapes
  String formatDateTime({String format = "dd/MM/yyyy 'às' HH:mm"}) {
    return DateFormat(format).format(this);
  }

  String formatHourMinute({String format = "HH:mm"}) {
    return DateFormat(format).format(this);
  }

  String formatHumamDiffFromNow() {
    final diff = DateTime.now().difference(this);

    if (diff.inDays > 0) {
      return 'há ${diff.inDays} dia${diff.inDays > 1 ? 's' : ''}';
    }

    if (diff.inHours > 0) {
      return 'há ${diff.inHours} hora${diff.inHours > 1 ? 's' : ''}';
    }

    if (diff.inMinutes > 0) {
      return 'há ${diff.inMinutes} minuto${diff.inMinutes > 1 ? 's' : ''}';
    }

    return 'agora';
  }

  bool isDateWithinInterval(int intervalInDays, {bool ignoreYear = false}) {
    DateTime now = DateTime.now();
    now = DateTime(now.year, now.month, now.day); // set to start of day

    if (ignoreYear) {
      DateTime inputDateWithoutYear = DateTime(year, now.month, now.day);

      int differenceInDays = difference(inputDateWithoutYear).inDays;

      return differenceInDays >= 0 && differenceInDays <= intervalInDays;
    }

    int differenceInDays = difference(now).inDays;
    return differenceInDays >= 0 && differenceInDays <= intervalInDays;
  }

  bool get isToday {
    final now = DateTime.now();
    return now.day == day && now.month == month && now.year == year;
  }
}

extension Iterables<E> on Iterable<E> {
  Map<K, List<E>> groupBy<K>(K Function(E) keyFunction) => fold(
      <K, List<E>>{},
      (Map<K, List<E>> map, E element) =>
          map..putIfAbsent(keyFunction(element), () => <E>[]).add(element));
}

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF$hexColor";
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}
