

import 'package:evently_plan/core/DM/category.dart';
import 'package:evently_plan/core/colors_maneger.dart';
import 'package:evently_plan/core/widgets/tab_bar_controller.dart';
import 'package:evently_plan/views/Authentication/widgets/custom_elevated_button.dart';
import 'package:evently_plan/views/Authentication/widgets/custom_text_button.dart';
import 'package:evently_plan/views/Authentication/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CreateEvent extends StatefulWidget {
  const CreateEvent({super.key});

  @override
  State<CreateEvent> createState() => _CreateEventState();
}

class _CreateEventState extends State<CreateEvent> {
  int selectTab = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Create Event")),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 16.0, right: 16, left: 16),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image(
                  image: AssetImage(categorysWithOutAll[selectTab].imagePath),
                ),
              ),
            ),
            CustomTabBarController(
              categorysList: categorysWithOutAll,
              selectColorFont: ColorsManager.white,
              unselectColorFont: ColorsManager.blue,
              selectColorBG: ColorsManager.blue,
              unselectColorBG: Colors.transparent,
              onTap: (value) {
                selectTab = value;
                setState(() {});
              },
              selectTabIndex: selectTab,
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'title',
                    style: Theme.of(
                      context,
                    ).textTheme.titleMedium!.copyWith(fontSize: 16),
                  ),
                  SizedBox(height: 8),
                  CustomTextFormField(
                    txt: "Event Title",
                    icon: FontAwesomeIcons.penToSquare,
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Description',
                    style: Theme.of(
                      context,
                    ).textTheme.titleMedium!.copyWith(fontSize: 16),
                  ),
                  SizedBox(height: 8),
                  CustomTextFormField(
                    maxLineSelect: 5,
                    txt: "Event Description",
                    icon: FontAwesomeIcons.penToSquare,
                  ),
                  SizedBox(height: 16),
                  Row(
                    children: [
                      const Icon(Icons.date_range),
                      SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          "Event Date",
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ),
                      CustomTextButton(txt: "Choose Date", onPressed: () {}),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(Icons.access_time_outlined),
                      SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          "Event Time",
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ),
                      CustomTextButton(txt: "Choose Date", onPressed: () {}),
                    ],
                  ),
                  SizedBox(height: 16),
                  CustomElevatedButton(txt: "Add Event", onPressed: () {}),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
