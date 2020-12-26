import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nigerian_banks/controls/getBanks.dart';
import 'package:nigerian_banks/models/bank_model.dart';
import 'package:nigerian_banks/utils/test/selector_config.dart';
import 'package:nigerian_banks/utils/test/test_helper.dart';
import 'package:nigerian_banks/widget/bank_search_list_widget.dart';
import 'package:nigerian_banks/widget/item.dart';

/// Enum for [SelectorButton] types.
///
/// Available type includes:
///   * [BankInputSelectorType.DROPDOWN]
///   * [BankInputSelectorType.BOTTOM_SHEET]
///   * [BankInputSelectorType.DIALOG]
enum BankInputSelectorType { DROPDOWN, BOTTOM_SHEET, DIALOG }

/// main class [Banks] with properties:
/// *[Banks.onInputChanged]
///  *[Banks.onInputValidated]
///  *[Banks.selectorConfig]
///  *[Banks.onSubmit]
///  *[Banks.onFieldSubmitted]
///  *[Banks.validator]
///  *[Banks.onSaved]
///  *[Banks.textFieldController]
///  *[Banks.keyboardAction]
///  *[Banks.initialValue]
///  *[Banks.hintText]
///  *[Banks.errorMessage]
///  *[Banks.selectorButtonOnErrorPadding]
///  *[Banks.maxLength]
///  *[Banks.isEnabled]
///  *[Banks.showLogo]
///  *[Banks.autoFocus]
///  *[Banks.autoFocusSearch]
///  *[Banks.autoValidateMode]
///  *[Banks.ignoreBlank]
///  *[Banks.bankSelectorScrollControlled]
///  *[Banks.textStyle]
///  *[Banks.selectorTextStyle]
///  *[Banks.inputBorder]
///  *[Banks.inputDecoration]
///  *[Banks.searchBoxDecoration]
///  *[Banks.focusNode]
///  *[Banks.banks]
///
class Banks extends StatefulWidget {
  Banks(
      {Key key,
      @required this.onInputChanged,
      this.onInputValidated,
      this.onSubmit,
      this.onFieldSubmitted,
      this.validator,
      this.onSaved,
      this.textFieldController,
      this.keyboardAction,
      this.initialValue,
      this.hintText = 'Select Bank',
      this.errorMessage = 'Select a bank from the list',
      this.selectorButtonOnErrorPadding = 24,
      this.maxLength = 15,
      this.isEnabled = true,
      this.showLogo = true,
      this.autoFocus = false,
      this.autoFocusSearch = false,
      this.autoValidateMode = AutovalidateMode.disabled,
      this.ignoreBlank = false,
      this.bankSelectorScrollControlled = true,
      this.textStyle,
      this.selectorTextStyle,
      this.inputBorder,
      this.inputDecoration,
      this.searchBoxDecoration,
      this.focusNode,
      this.banks,
      this.selectorConfig})
      : super(key: key);

  final ValueChanged<BankModel> onInputChanged;
  final ValueChanged<bool> onInputValidated;
  final SelectorConfig selectorConfig;
  final VoidCallback onSubmit;
  final ValueChanged<String> onFieldSubmitted;
  final String Function(String) validator;
  final Function(String) onSaved;

  final TextEditingController textFieldController;
  final TextInputAction keyboardAction;

  final BankModel initialValue;
  final String hintText;
  final String errorMessage;

  final double selectorButtonOnErrorPadding;
  final int maxLength;

  final bool isEnabled;
  final bool showLogo;
  final bool autoFocus;
  final bool autoFocusSearch;
  final AutovalidateMode autoValidateMode;
  final bool ignoreBlank;
  final bool bankSelectorScrollControlled;

  final TextStyle textStyle;
  final TextStyle selectorTextStyle;
  final InputBorder inputBorder;
  final InputDecoration inputDecoration;
  final InputDecoration searchBoxDecoration;

  final FocusNode focusNode;

  final List<BankModel> banks;

  @override
  _BanksState createState() => _BanksState();
}

class _BanksState extends State<Banks> {
  TextEditingController controller;
  double selectorButtonBottomPadding = 0;

  BankModel bank;
  List<BankModel> banks = [];
  bool isNotValid = true;

  ///
  /// [initState] entry point of the widget, gets the banks and assigns [TextEditingController] to the widget
  @override
  void initState() {
    Future.delayed(Duration.zero, () => loadBanks());
    controller = widget.textFieldController ?? TextEditingController();
    startWidget();
    super.initState();
  }

  @override
  void setState(fn) {
    if (this.mounted) {
      super.setState(fn);
    }
  }

  /// [didUpdateWidget] checks the hash stamp to determine if the widget rebuilds. if there's a change, [loadBanks] function is call
  @override
  void didUpdateWidget(Banks oldWidget) {
    if (oldWidget.initialValue != widget.initialValue ||
        oldWidget.initialValue?.hash != widget.initialValue?.hash) {
      loadBanks();
      startWidget();
    }
    super.didUpdateWidget(oldWidget);
  }

  /// [startWidget] sets initial values of the widget
  void startWidget() async {
    if (widget.initialValue != null) {
      if (widget.initialValue.name != null &&
          widget.initialValue.name.isNotEmpty &&
          await isValidBank(slug: widget.initialValue.slug)) {
        controller.text = widget.initialValue.name;
        bankControllerListener();
      }
    }
  }

  /// [loadBanks] load up list of banks and returns initial bank.
  void loadBanks() {
    if (mounted) {
      List<BankModel> banks = widget.banks ?? getBanks();
      BankModel bank =
          initialBanks(banks: banks, slug: widget.initialValue?.slug ?? '');

      setState(() {
        this.banks = banks;
        this.bank = bank;
      });
    }
  }

  /// Listener that validates changes from the widget, returns a bool to
  /// the `ValueCallback` [widget.onInputValidated]
  void bankControllerListener() {
    if (this.mounted) {
//      String parsedBankName  =  controller.text;
      String parsedBankName = this.bank.name;

      getBankName(parsedBankName, this.bank?.name).then((bankName) {
        if (bankName == null) {
          String name = capitalize(parsedBankName);

          if (widget.onInputChanged != null) {
            setState(() {
              controller.text = name;
            });
            widget.onInputChanged(BankModel(
              name: name,
              slug: this.bank?.slug,
              code: this.bank?.code,
              ussd: this.bank?.ussd,
              logo: this.bank?.logo,
            ));
          }

          if (widget.onInputValidated != null) {
            widget.onInputValidated(false);
          }
          this.isNotValid = true;
        } else {
          if (widget.onInputChanged != null) {
            setState(() {
              controller.text = bankName;
            });
            widget.onInputChanged(BankModel(
              name: bankName,
              slug: this.bank?.slug,
              code: this.bank?.code,
              ussd: this.bank?.ussd,
              logo: this.bank?.logo,
            ));
          }

          if (widget.onInputValidated != null) {
            widget.onInputValidated(true);
          }
          this.isNotValid = false;
        }
      });
    }
  }

  /// Returns a formatted String of [bank]
  /// if [bank] is not valid or if an [Exception] is caught.
  Future<String> getBankName(String bankName, String slug) async {
    if (bankName.isNotEmpty && slug.isNotEmpty) {
      try {
        bool isValidBankName = await await isValidBank(slug: bankName);

        if (isValidBankName) {
          return await capitalize(bankName);
        }
      } on Exception {
        return null;
      }
    }
    return null;
  }

  /// Creates or Select [InputDecoration]
  InputDecoration getInputDecoration(
      {InputDecoration decoration, Widget prefix}) {
    return decoration != null
        ? InputDecoration(
            alignLabelWithHint: decoration?.alignLabelWithHint,
            border: decoration?.border,
            contentPadding: decoration?.contentPadding,
            counter: decoration?.counter,
            counterStyle: decoration?.counterStyle,
            counterText: decoration?.counterText,
            disabledBorder: decoration?.disabledBorder,
            enabled: decoration?.enabled,
            enabledBorder: decoration?.enabledBorder,
            errorBorder: decoration?.errorBorder,
            errorMaxLines: decoration?.errorMaxLines,
            errorStyle: decoration?.errorStyle,
            errorText: decoration?.errorText,
            fillColor: decoration?.fillColor,
            filled: decoration?.filled,
            floatingLabelBehavior: decoration?.floatingLabelBehavior,
            focusColor: decoration?.focusColor,
            focusedBorder: decoration?.focusedBorder,
            focusedErrorBorder: decoration?.focusedErrorBorder,
            helperMaxLines: decoration?.helperMaxLines,
            helperStyle: decoration?.helperStyle,
            helperText: decoration?.helperText,
            hintMaxLines: decoration?.hintMaxLines,
            hintStyle: decoration?.hintStyle,
            hintText: decoration?.hintText,
            hoverColor: decoration?.hoverColor,
            icon: decoration?.icon,
            isCollapsed: decoration?.isCollapsed,
            isDense: decoration?.isDense,
            labelStyle: decoration?.labelStyle,
            labelText: decoration?.labelText,
            semanticCounterText: decoration?.semanticCounterText,
            suffix: decoration?.suffix,
            suffixIcon: decoration?.suffixIcon ??
                Icon(
                  Icons.keyboard_arrow_down,
                  color: Color(0xFF12326B),
                ),
            suffixIconConstraints: decoration?.suffixIconConstraints,
            suffixStyle: decoration?.suffixStyle,
            suffixText: decoration?.suffixText,
            prefixIcon: prefix,
            prefix: decoration?.prefix,
            prefixIconConstraints: decoration?.prefixIconConstraints,
            prefixStyle: decoration?.prefixStyle,
            prefixText: decoration?.prefixText,
          )
        : InputDecoration(
            border: widget.inputBorder ?? UnderlineInputBorder(),
            hintText: widget.hintText,
            prefixIcon: prefix,
          );
  }

  /// [onChanged] Validate the phone number when a change occurs
  void onChanged(String value) {
    bankControllerListener();
  }

  /// [validator] Validate and returns a validation error when [FormState] validate is called.
  ///
  /// Also updates [selectorButtonBottomPadding]
  String validator(String value) {
    bool isValid =
        this.isNotValid && (value.isNotEmpty || widget.ignoreBlank == false);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if (isValid && widget.errorMessage != null) {
        setState(() {
          this.selectorButtonBottomPadding =
              widget.selectorButtonOnErrorPadding ?? 24;
        });
      } else {
        setState(() {
          this.selectorButtonBottomPadding = 0;
        });
      }
    });

    return isValid ? widget.errorMessage : null;
  }

  /// [onBankChanged] Changes Selector Button Country and Validate Change.
  void onBankChanged(BankModel bank) {
    setState(() {
      this.bank = bank;
    });
    bankControllerListener();
  }

  @override
  Widget build(BuildContext context) {
    return widget.selectorConfig.selectorType == BankInputSelectorType.DROPDOWN
        ? this.banks.isNotEmpty && this.banks.length > 1
            ? DropdownButtonHideUnderline(
                child: DropdownButton<BankModel>(
                  key: Key(TestHelper.DropdownButtonKeyValue),
                  hint: AbsorbPointer(
                    child: TextFormField(
                      key: Key(TestHelper.TextInputKeyValue),
                      textDirection: TextDirection.ltr,
                      controller: this.controller,
                      focusNode: widget.focusNode,
                      enabled: widget.isEnabled,
                      autofocus: widget.autoFocus,
                      keyboardType: TextInputType.phone,
                      textInputAction: widget.keyboardAction,
                      style: widget.textStyle,
                      decoration: this.getInputDecoration(
                        decoration: widget.inputDecoration,
                        prefix: (widget.showLogo)?Item(
                          bank: bank,
                          showLogo: widget.selectorConfig?.showLogo,
                        ):null,
                      ),
                      onEditingComplete: widget.onSubmit,
                      onFieldSubmitted: widget.onFieldSubmitted,
                      autovalidateMode: widget.autoValidateMode,
                      validator: widget.validator ?? this.validator,
                      onSaved: widget.onSaved,
                      onChanged: this.onChanged,
                    ),
                  ),
                  value: bank,
                  items: mapBankModelToDropdownItem(banks),
                  onChanged: widget.isEnabled ? onBankChanged : null,
                ),
              )
            : AbsorbPointer(
                child: TextFormField(
                  key: Key(TestHelper.TextInputKeyValue),
                  textDirection: TextDirection.ltr,
                  controller: this.controller,
                  focusNode: widget.focusNode,
                  enabled: widget.isEnabled,
                  autofocus: widget.autoFocus,
                  keyboardType: TextInputType.phone,
                  textInputAction: widget.keyboardAction,
                  style: widget.textStyle,
                  decoration: this.getInputDecoration(
                    decoration: widget.inputDecoration,
                    prefix: (widget.showLogo)?Item(
                      bank: bank,
                      showLogo: widget.selectorConfig?.showLogo,
                    ):null,
                  ),
                  onEditingComplete: widget.onSubmit,
                  onFieldSubmitted: widget.onFieldSubmitted,
                  autovalidateMode: widget.autoValidateMode,
                  validator: widget.validator ?? this.validator,
                  onSaved: widget.onSaved,
                  onChanged: this.onChanged,
                ),
              )
        : MaterialButton(
            key: Key(TestHelper.DropdownButtonKeyValue),
            padding: EdgeInsets.zero,
            minWidth: 0,
            onPressed: banks.isNotEmpty && banks.length > 1
                ? () async {
                    BankModel selected;
                    if (widget.selectorConfig.selectorType ==
                        BankInputSelectorType.BOTTOM_SHEET) {
                      selected = await showBankModelSelectorBottomSheet(
                          context, banks);
                    } else {
                      selected =
                          await showBankModelSelectorDialog(context, banks);
                    }

                    if (selected != null) {
                      print(selected.name);
                      onBankChanged(selected);
                    }
                  }
                : null,
            child: AbsorbPointer(
              child: TextFormField(
                key: Key(TestHelper.TextInputKeyValue),
                textDirection: TextDirection.ltr,
                controller: this.controller,
                focusNode: widget.focusNode,
                enabled: widget.isEnabled,
                autofocus: widget.autoFocus,
                keyboardType: TextInputType.phone,
                textInputAction: widget.keyboardAction,
                style: widget.textStyle,
                decoration: this.getInputDecoration(
                  decoration: widget.inputDecoration,
                  prefix: (widget.showLogo)?Item(
                    bank: bank,
                    showLogo: widget.selectorConfig?.showLogo,
                  ):null,
                ),
                onEditingComplete: widget.onSubmit,
                onFieldSubmitted: widget.onFieldSubmitted,
                autovalidateMode: widget.autoValidateMode,
                validator: widget.validator ?? this.validator,
                onSaved: widget.onSaved,
                onChanged: this.onChanged,
              ),
            ),
          );
  }

  /// [mapBankModelToDropdownItem] returns a drop down with list of banks
  List<DropdownMenuItem<BankModel>> mapBankModelToDropdownItem(
      List<BankModel> banks) {
    return banks.map((bank) {
      return DropdownMenuItem<BankModel>(
        value: bank,
        child: Item(
          key: Key(TestHelper.bankItemKeyValue(bank.slug)),
          bank: bank,
          showLogo: widget.selectorConfig.showLogo,
        ),
      );
    }).toList();
  }

  /// [showBankModelSelectorDialog] returns a modal with list of banks
  Future<BankModel> showBankModelSelectorDialog(
      BuildContext context, List<BankModel> banks) {
    return showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) => AlertDialog(
        content: Container(
          width: double.maxFinite,
          child: BankModelSearchListWidget(
            banks,
            searchBoxDecoration: widget.searchBoxDecoration,
            showLogo: widget.selectorConfig?.showLogo,
            showCode: widget.selectorConfig?.showCode,
            autoFocus: widget.autoFocusSearch,
          ),
        ),
      ),
    );
  }

  /// [showBankModelSelectorBottomSheet] return a bottom modal with list of banks to select from
  Future<BankModel> showBankModelSelectorBottomSheet(
      BuildContext context, List<BankModel> banks) {
    return showModalBottomSheet(
      context: context,
      clipBehavior: Clip.hardEdge,
      isScrollControlled: widget.bankSelectorScrollControlled ?? true,
      backgroundColor: Colors.transparent,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12), topRight: Radius.circular(12))),
      builder: (BuildContext context) {
        return AnimatedPadding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          duration: const Duration(milliseconds: 100),
          child: DraggableScrollableSheet(
            builder: (BuildContext context, ScrollController controller) {
              return Container(
                decoration: ShapeDecoration(
                  color: widget.selectorConfig?.backgroundColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12),
                      topRight: Radius.circular(12),
                    ),
                  ),
                ),
                child: BankModelSearchListWidget(
                  banks,
                  searchBoxDecoration: widget.searchBoxDecoration,
                  scrollController: controller,
                  showLogo: widget.selectorConfig.showLogo,
                  autoFocus: widget.autoFocusSearch,
                ),
              );
            },
          ),
        );
      },
    );
  }
}
