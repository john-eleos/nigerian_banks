import 'package:flutter/material.dart';
import 'package:nigerian_banks/models/bank_model.dart';

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

class _Logo extends StatelessWidget {
  final BankModel bank;
  final bool showLogo;

  const _Logo({Key key, this.bank, this.showLogo})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return bank != null && showLogo
           ? bank?.logo != null
                    ?
                  Container(
                    height: 25,
                    width: 25,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                        image: DecorationImage(
                          image: AssetImage(bank.logo, package: 'nigerian_banks'),
                          fit: BoxFit.contain,
                          )
                        ),
                    )
                    : SizedBox.shrink()
           : SizedBox.shrink();
    }
  }