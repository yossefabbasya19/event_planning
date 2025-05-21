import 'package:evently_plan/core/extintion/date_ex.dart';
import 'package:evently_plan/core/extintion/time_ex.dart';
import 'package:evently_plan/core/validation_rules/validation_rules.dart';
import 'package:evently_plan/views/create_event/feature_function/add_event.dart';
import 'package:evently_plan/views/create_event/feature_function/choose_date.dart';
import 'package:evently_plan/views/create_event/feature_function/choose_time.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
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
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  int selectTab = 0;
  Category? selectedCategory;
  DateTime? eventDate;

  TimeOfDay? eventTime;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    titleController.dispose();
    descriptionController.dispose();
  }

  GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    List<Category> categorysWithOutAll = getCategorysWithOutAll(context);
    return Scaffold(
      appBar: AppBar(title: Text(AppLocalizations.of(context)!.create_event)),
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
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
                  selectedCategory = categorysWithOutAll[value];
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
                      AppLocalizations.of(context)!.title,
                      style: Theme.of(
                        context,
                      ).textTheme.titleMedium!.copyWith(fontSize: 16),
                    ),
                    SizedBox(height: 8),
                    CustomTextFormField(
                      validate: ValidationRules.titleValidation,
                      myController: titleController,
                      txt: AppLocalizations.of(context)!.event_title,
                      icon: FontAwesomeIcons.penToSquare,
                    ),
                    SizedBox(height: 16),
                    Text(
                      AppLocalizations.of(context)!.description,
                      style: Theme.of(
                        context,
                      ).textTheme.titleMedium!.copyWith(fontSize: 16),
                    ),
                    SizedBox(height: 8),
                    CustomTextFormField(
                      validate: ValidationRules.descriptionValidation,
                      myController: descriptionController,
                      maxLineSelect: 5,
                      txt: AppLocalizations.of(context)!.event_description,
                      icon: FontAwesomeIcons.penToSquare,
                    ),
                    SizedBox(height: 16),
                    Row(
                      children: [
                        const Icon(Icons.date_range),
                        SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            eventDate?.dateFormated ??
                                AppLocalizations.of(context)!.event_date,
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ),
                        CustomTextButton(
                          txt: AppLocalizations.of(context)!.choose_date,
                          onPressed: () async {
                            eventDate = await chooseDate(context);
                            setState(() {});
                          },
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const Icon(Icons.access_time_outlined),
                        SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            eventTime?.timeFormated ??
                                AppLocalizations.of(context)!.event_time,
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ),
                        CustomTextButton(
                          txt: AppLocalizations.of(context)!.choose_time,
                          onPressed: () async {
                            eventTime = await chooseTime(context);
                            eventDate = eventDate!.copyWith(
                              hour: eventTime!.hour,
                              minute: eventTime!.minute,
                            );
                            setState(() {});
                          },
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    CustomElevatedButton(
                      txt: AppLocalizations.of(context)!.add_event,
                      onPressed: () {
                        if(formKey.currentState!.validate()){
                          addEvent(
                            titleController,
                            descriptionController,
                            selectedCategory,
                            eventDate,
                            context,
                          );
                        }
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
