import 'package:flutter/material.dart';
import 'package:nigerian_banks/models/bank_model.dart';

/// [Item] class renders the bank logo with an option to either show the logo or not using the [_Logo] class.
///
/// [Item.bank] is the bank to be rendered
/// [Item.showLogo] boolean to determine if logo should be displayed
///
///
class Item extends StatelessWidget {
  final BankModel bank;
  final bool showLogo;

  const Item({
    Key key,
    this.bank,
    this.showLogo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: _Logo(
        bank: bank,
        showLogo: showLogo,
      ),
    );
  }
}

/// [_Logo] class to show bank logo
/// [_Logo.bank] is the bank to be rendered
/// [_Logo.showLogo] boolean to determine if logo should be displayed
///
///
class _Logo extends StatelessWidget {
  final BankModel bank;
  final bool showLogo;

  const _Logo({Key key, this.bank, this.showLogo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return bank != null && showLogo
        ? bank?.logo != null
            ? Container(
                height: 25,
                width: 25,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage(bank.logo, package: 'nigerian_banks'),
                      fit: BoxFit.contain,
                    )),
              )
            : SizedBox.shrink()
        : SizedBox.shrink();
  }
}
