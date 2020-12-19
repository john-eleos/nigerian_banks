import 'package:nigerian_banks/models/bank_model.dart';
import 'package:nigerian_banks/models/banks_list.dart';




// return list of banks
 getBanks() =>bankModelFromJson(bankList);


initialBanks({List<BankModel> banks, String slug})=>banks.firstWhere((b) => b.slug==slug, orElse: ()=> banks[0]);


isValidBank({String slug}){
  List<BankModel> banks = getBanks();
  return (banks.firstWhere((b) => b.name==slug||b.slug==slug, orElse: ()=>null)!=null);
  }


capitalize(String text){
  if (text == null) throw ArgumentError("string: $text");

  if (text.isEmpty) return text;

  /// splits [text] by space and convert all first character to caps
  return text
      .split(' ')
      .map((word) => word[0].toUpperCase() + word.substring(1))
      .join(' ');
  }