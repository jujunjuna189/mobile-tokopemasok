class Formatter {
  Formatter._privateConstructor();
  static final Formatter instance = Formatter._privateConstructor();

  final months = [
    'Januari',
    'Februari',
    'Maret',
    'April',
    'Mei',
    'Juni',
    'Juli',
    'Agustus',
    'September',
    'Oktober',
    'November',
    'Desember'
  ];
  final days = ['Senin', 'Selasa', 'Rabu', 'Kamis', 'Jumat', 'Sabtu', 'Minggu'];

  String dateV1(String dateTime) {
    DateTime date = DateTime.parse(dateTime).toLocal();
    String formatterDate = "${setZero(date.day)} ${months[date.month - 1]} ${date.year}";

    return formatterDate;
  }

  String timeV1(String dateTime) {
    DateTime date = DateTime.parse(dateTime).toLocal();
    String formatterTime = "${setZero(date.hour)}.${setZero(date.minute)}";

    return formatterTime;
  }

  String setZero(int value) {
    String data = (value < 10) ? "0${value.toString()}" : value.toString();

    return data;
  }

  String decimal(double price, {String thousandsSeparator = '.', int decimalDigits = 2}) {
    // Pisahkan angka menjadi bagian utuh dan pecahan
    String formattedPrice = price.toStringAsFixed(decimalDigits);
    List<String> parts = formattedPrice.split('.');

    // Pisahkan angka utuh menjadi tiga angka setiap grup dan tambahkan tanda koma sebagai pemisah ribuan
    String wholeNumber = parts[0];
    String formattedWholeNumber = '';
    int count = 0;
    for (int i = wholeNumber.length - 1; i >= 0; i--) {
      if (count != 0 && count % 3 == 0) {
        formattedWholeNumber = thousandsSeparator + formattedWholeNumber;
      }
      formattedWholeNumber = wholeNumber[i] + formattedWholeNumber;
      count++;
    }

    // Jika ada pecahan, tambahkan titik dan pecahan
    String formattedPriceResult = formattedWholeNumber;
    if (parts.length > 1) {
      formattedPriceResult += ',${parts[1]}';
    }

    // Tambahkan simbol mata uang atau format tambahan sesuai kebutuhan
    return formattedPriceResult; // Hapus simbol mata uang dolar
  }

  String price(double price, {String thousandsSeparator = '.', int decimalDigits = 2}) {
    // Pisahkan angka menjadi bagian utuh dan pecahan
    String formattedPrice = price.toStringAsFixed(decimalDigits);
    List<String> parts = formattedPrice.split('.');

    // Pisahkan angka utuh menjadi tiga angka setiap grup dan tambahkan tanda koma sebagai pemisah ribuan
    String wholeNumber = parts[0];
    String formattedWholeNumber = '';
    int count = 0;
    for (int i = wholeNumber.length - 1; i >= 0; i--) {
      if (count != 0 && count % 3 == 0) {
        formattedWholeNumber = thousandsSeparator + formattedWholeNumber;
      }
      formattedWholeNumber = wholeNumber[i] + formattedWholeNumber;
      count++;
    }

    // Jika ada pecahan, tambahkan titik dan pecahan
    String formattedPriceResult = formattedWholeNumber;
    if (parts.length > 1) {
      formattedPriceResult += ',${parts[1]}';
    }

    // Tambahkan simbol mata uang atau format tambahan sesuai kebutuhan
    return 'Rp$formattedPriceResult'; // Hapus simbol mata uang dolar
  }
}
