import 'package:nigerian_banks/models/bank_model.dart';
import 'package:nigerian_banks/models/banks_list.dart';

/// [getBanks] return list of [BankModel] object
getBanks() => bankModelFromJson(bankList);

/// [initialBanks] return initial bank if selected else it returns the first bank in the [List] of [BankModel]
initialBanks({List<BankModel> banks, String slug}) =>
    banks.firstWhere((b) => b.slug == slug, orElse: () => banks[0]);

/// [isValidBank] checks if selected bank exist in the list of banks
isValidBank({String slug,List<BankModel> banks}) {
//    = getBanks();
  return (banks.firstWhere((b) => b.name == slug || b.slug == slug,
          orElse: () => null) !=
      null);
}

/// [capitalize] formats text and returns its capitalized form
capitalize(String text) {
  if (text == null) throw ArgumentError("string: $text");

  if (text.isEmpty) return text;

  /// splits [text] by space and convert all first character to caps
  return text
      .split(' ')
      .map((word) => word[0].toUpperCase() + word.substring(1))
      .join(' ');
}
