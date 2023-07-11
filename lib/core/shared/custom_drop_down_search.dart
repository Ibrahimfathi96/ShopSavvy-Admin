import 'package:drop_down_list/drop_down_list.dart';
import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:flutter/material.dart';
import 'package:shop_savvy_admin/core/constants/color.dart';

class CustomDropDownSearch extends StatefulWidget {
  final String title;
  final List<SelectedListItem> dataList;
  final TextEditingController dropDownSelectedName;

  final TextEditingController dropDownSelectedId;

  const CustomDropDownSearch(
      {super.key,
      required this.title,
      required this.dataList,
      required this.dropDownSelectedName,
      required this.dropDownSelectedId});

  @override
  State<CustomDropDownSearch> createState() => _CustomDropDownSearchState();
}

class _CustomDropDownSearchState extends State<CustomDropDownSearch> {
  void showDropDownSearch() {
    DropDownState(
      DropDown(
        isDismissible: true,
        bottomSheetTitle: Text(
          widget.title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
            color: AppColors.primaryDark,
          ),
        ),
        submitButtonChild: const Text(
          'Done',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        data: widget.dataList,
        selectedItems: (List<dynamic> selectedList) {
          SelectedListItem selectedListItem = selectedList[0];
          widget.dropDownSelectedName.text = selectedListItem.name;
          widget.dropDownSelectedId.text = selectedListItem.value!;
        },
      ),
    ).showModal(context);
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.dropDownSelectedName,
      cursorColor: Colors.black,
      onTap: () {
        FocusScope.of(context).unfocus();
        showDropDownSearch();
      },
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.black12,
        contentPadding:
            const EdgeInsets.only(left: 20, bottom: 0, top: 0, right: 15),
        hintText: widget.dropDownSelectedName.text == ""
            ? widget.title
            : widget.dropDownSelectedName.text,
        hintStyle: TextStyle(
          fontWeight: FontWeight.bold,
          color: AppColors.primaryDark,
        ),
        border: const OutlineInputBorder(
          borderSide: BorderSide(
            width: 0,
            style: BorderStyle.none,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(16.0),
          ),
        ),
      ),
    );
  }
}
