
/// [TestHelper] class contains key helper for text input, drop down button, search input and bank items
class TestHelper {

  /// [TextInputKeyValue] special key for text input
  static const String TextInputKeyValue = 'nigerian_bank_input_key';
  /// [DropdownButtonKeyValue] special key for drop down
  static const String DropdownButtonKeyValue = 'nigerian_bank_dropdown_key';
  /// [SearchInputKeyValue] special key for search input
  static const String SearchInputKeyValue = 'nigerian_bank_search_input_key';
  /// [bankItemKeyValue] function to assign special key to each bank item
  static String Function(String slug) bankItemKeyValue =
      (String slug) => 'eleos_${slug.toUpperCase()}_key';
}
