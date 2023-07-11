import 'package:drop_down_list/drop_down_list.dart';
import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:flutter/material.dart';
import 'package:shop_savvy_admin/core/constants/color.dart';

class CustomDropDownSearch extends StatefulWidget {
  final String title;
  final String label;
  final List<SelectedListItem> dataList;
  final TextEditingController dropDownSelectedName;

  final TextEditingController dropDownSelectedId;

  const CustomDropDownSearch(
      {super.key,
      required this.title,
      required this.dataList,
      required this.dropDownSelectedName,
      required this.dropDownSelectedId,
      required this.label});

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
        floatingLabelBehavior: FloatingLabelBehavior.always,
        contentPadding: const EdgeInsets.symmetric(vertical: 6, horizontal: 30),
        border: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.deepOrangeAccent),
          borderRadius: BorderRadius.circular(30),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.deepOrangeAccent),
          borderRadius: BorderRadius.circular(30),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.deepOrangeAccent),
          borderRadius: BorderRadius.circular(30),
        ),
        hintText: widget.dropDownSelectedName.text == ""
            ? widget.title
            : widget.dropDownSelectedName.text,
        hintStyle: TextStyle(
          fontWeight: FontWeight.bold,
          color: AppColors.primaryDark,
        ),
        label: Container(
          margin: const EdgeInsets.symmetric(
            horizontal: 16,
          ),
          child: Text(
            widget.label,
          ),
        ),
        labelStyle: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Colors.deepOrangeAccent),
        suffixIcon: IconButton(
          padding: EdgeInsets.only(right: 20),
          onPressed: () {},
          icon: Icon(Icons.arrow_drop_down_circle),
          color: Colors.deepOrangeAccent,
        ),
      ),
    );
  }
}
