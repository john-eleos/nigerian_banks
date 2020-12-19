import 'package:flutter/material.dart';
import 'package:nigerian_banks/models/bank_model.dart';
import 'package:nigerian_banks/widget/banks.dart';
/// [BankModelComparator] takes two banks: A and B.
///
/// Should return -1 if A precedes B, 0 if A is equal to B and 1 if B precedes A
typedef BankModelComparator = int Function(BankModel, BankModel);

/// [SelectorConfig] contains selector button configurations
class SelectorConfig {
  /// [selectorType], for selector button type
  final BankInputSelectorType selectorType;

  /// [showLogo], displays logo along side banks info on selector button
  /// and list items within the selector
  final bool showLogo;
  final bool showCode;


  final Color backgroundColor;

  /// [bankComparator], sort the bank list according to the comparator.
  ///
  /// Sorting is disabled by default
  final BankModelComparator bankComparator;

  const SelectorConfig({
    this.selectorType = BankInputSelectorType.BOTTOM_SHEET,
    this.showLogo = true, this.showCode,
    this.backgroundColor = Colors.white,
    this.bankComparator,
  });
}
