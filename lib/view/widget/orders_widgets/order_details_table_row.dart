import 'package:flutter/material.dart';
import 'package:shop_savvy_admin/view/widget/orders_widgets/table_row_title_texts.dart';

class OrdersTableRow extends StatelessWidget {
  final String rightText;
  final String middleText;
  final String leftText;
  final bool isTitleText;

  const OrdersTableRow({
    super.key,
    required this.rightText,
    required this.middleText,
    required this.leftText,
    this.isTitleText = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
            flex: 1,
            child: TableTitleTexts(
              titleText: isTitleText,
              text: leftText,
            ),
          ),
          Expanded(
            flex: 1,
            child: TableTitleTexts(
              titleText: isTitleText,
              text: middleText,
            ),
          ),
          Expanded(
            flex: 1,
            child: TableTitleTexts(
              titleText: isTitleText,
              text: rightText,
            ),
          ),
        ],
      ),
    );
  }
}
