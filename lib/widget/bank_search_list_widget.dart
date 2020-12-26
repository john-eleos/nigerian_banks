import 'package:flutter/material.dart';
import 'package:nigerian_banks/models/bank_model.dart';
import 'package:nigerian_banks/utils/test/test_helper.dart';


/// [BankModelSearchListWidget] class for the search list
/// [BankModelSearchListWidget.banks]
/// [BankModelSearchListWidget.searchBoxDecoration]
/// [BankModelSearchListWidget.scrollController]
/// [BankModelSearchListWidget.autoFocus]
/// [BankModelSearchListWidget.showLogo]
/// [BankModelSearchListWidget.showCode]
///
class BankModelSearchListWidget extends StatefulWidget {
  final List<BankModel> banks;
  final InputDecoration searchBoxDecoration;
  final ScrollController scrollController;
  final bool autoFocus;
  final bool showLogo;
  final bool showCode;

  BankModelSearchListWidget(this.banks,
      {this.searchBoxDecoration,
      this.scrollController,
      this.showLogo,
      this.showCode = false,
      this.autoFocus = false});

  @override
  _BankModelSearchListWidgetState createState() =>
      _BankModelSearchListWidgetState();
}

class _BankModelSearchListWidgetState extends State<BankModelSearchListWidget> {
  TextEditingController _searchController = TextEditingController();
  List<BankModel> filteredBanks;

  @override
  void initState() {
    filteredBanks = filterCountries();
    super.initState();
  }

  @override
  void dispose() {
    _searchController?.dispose();
    super.dispose();
  }
/// [getSearchBoxDecoration] function to return [InputDecoration] for searchBox if it's not null else returns a basic decoration with [labelText]
  InputDecoration getSearchBoxDecoration() {
    return widget.searchBoxDecoration ??
        InputDecoration(labelText: 'Search by bank name or dial code');
  }
/// [filterCountries] function returns banks with its [BankModel] contains the value searched
  List<BankModel> filterCountries() {
    final value = _searchController.text.trim();

    if (value.isNotEmpty) {
      return widget.banks
          .where(
            (BankModel bank) =>
                bank.slug.toLowerCase().startsWith(value.toLowerCase()) ||
                bank.name.toLowerCase().contains(value.toLowerCase()) ||
                bank.code.contains(value.toLowerCase()) ||
                bank.ussd.contains(value.toLowerCase()),
          )
          .toList();
    }

    return widget.banks;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(
          padding:
              const EdgeInsets.only(left: 15, right: 35, top: 20, bottom: 10),
          height: 70,
          child: TextFormField(
            key: Key(TestHelper.SearchInputKeyValue),
            decoration: getSearchBoxDecoration(),
            controller: _searchController,
            autofocus: widget.autoFocus,
            onChanged: (value) =>
                setState(() => filteredBanks = filterCountries()),
          ),
        ),
        Expanded(
          child: ListView.builder(
            controller: widget.scrollController,
            shrinkWrap: true,
            itemCount: filteredBanks.length,
            itemBuilder: (BuildContext context, int index) {
              BankModel bank = filteredBanks[index];
              if (bank == null) return null;
              return ListTile(
                key: Key(TestHelper.bankItemKeyValue(bank.slug)),
                leading: widget.showLogo ? _Logo(bank: bank) : null,
                title: Align(
                    alignment: AlignmentDirectional.centerStart,
                    child: Text('${bank.name}', textAlign: TextAlign.start)),
                subtitle: widget.showCode
                    ? Align(
                        alignment: AlignmentDirectional.centerStart,
                        child: Text('${bank?.code ?? ''}',
                            textDirection: TextDirection.ltr,
                            textAlign: TextAlign.start))
                    : null,
                onTap: () => Navigator.of(context).pop(bank),
              );
            },
          ),
        ),
      ],
    );
  }
}

/// [_Logo] class to show bank logo
/// [_Logo] class to show bank logo
/// [_Logo.bank] is the bank to be rendered
/// [_Logo.showLogo] boolean to determine if logo should be displayed
///
///
class _Logo extends StatelessWidget {
  final BankModel bank;

  const _Logo({Key key, this.bank}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return bank != null
        ? bank?.logo != null
            ? SizedBox(
                height: 25,
                width: 25,
                child: Container(
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage(bank.logo, package: 'nigerian_banks'),
                        fit: BoxFit.contain,
                      )),
                ),
              )
            : SizedBox.shrink()
        : SizedBox.shrink();
  }
}
