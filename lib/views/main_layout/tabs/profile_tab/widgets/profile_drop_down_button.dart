import 'package:evently_plan/core/colors_maneger.dart';
import 'package:flutter/material.dart';

class ProfileDropDownButton extends StatelessWidget {
  final void Function(String?)? onChange;
  final List<String> items;
  final String label;
  final String selected;

  const ProfileDropDownButton({
    super.key,
    this.onChange,
    required this.items,
    required this.label,
    required this.selected,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 16, right: 16, top: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: ColorsManager.blue),
            ),
            margin: EdgeInsets.only(top: 16),
            padding: EdgeInsets.all(16),
            child: Row(
              children: [
                Text(
                  selected,
                  style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Spacer(),
                DropdownButton(
                  underline: SizedBox(),
                  iconSize: 40,
                  iconEnabledColor: ColorsManager.blue,
                  icon: Icon(Icons.arrow_drop_down_rounded),
                  items:
                      items.map((e) {
                        return DropdownMenuItem(
                          value: e,
                          child: Text(
                            e,
                            style: Theme.of(context).textTheme.labelMedium!,
                          ),
                        );
                      }).toList(),
                  onChanged: onChange,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
