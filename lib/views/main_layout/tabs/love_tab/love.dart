import 'package:evently_plan/core/DM/user_DM.dart';
import 'package:evently_plan/core/colors_maneger.dart';
import 'package:evently_plan/core/firebase_service/firebase_service.dart';
import 'package:evently_plan/views/main_layout/tabs/home_tab/cubit/add_event_to_favorite_list/add_event_to_favorite_list_cubit.dart';
import 'package:evently_plan/views/main_layout/tabs/home_tab/widgets/event_details_card.dart';
import 'package:evently_plan/views/main_layout/tabs/love_tab/cubit/search_about_favorites_cubit.dart';
import 'package:evently_plan/views/main_layout/tabs/love_tab/repo/love_repo_imple.dart';
import 'package:evently_plan/views/main_layout/tabs/love_tab/widgets/search_text_form_feild.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Love extends StatefulWidget {
  const Love({super.key});

  @override
  State<Love> createState() => _LoveState();
}

class _LoveState extends State<Love> {
  TextEditingController searchController = TextEditingController();
  List<String> currentUserFavorites = [];
  List<String> currentUserFavoritesWithSearch = [];

  @override
  void initState() {
    currentUserFavorites = UserDm.currentUser!.favoritesList;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchAboutFavoritesCubit(LoveRepoImple()),
      child: BlocBuilder<
        AddAndRemoveEventToFavoriteListCubit,
        AddAndRemoveEventToFavoriteListState
      >(
        builder: (context, state) {
          return SafeArea(
            child: StreamBuilder(
              stream: FirebaseService.getDataRealTime(context, "0"),
              builder: (context, snapShot) {
                if (snapShot.hasData) {
                  return Column(
                    children: [
                      SizedBox(height: 16),
                      Padding(
                        padding: const EdgeInsets.all(16),
                        child: SearchTextFormFeild(
                          onChange: (value) {
                            BlocProvider.of<SearchAboutFavoritesCubit>(
                              context,
                            ).searchAboutFavorite(
                              snapShot,
                              value,
                              currentUserFavorites,
                              currentUserFavoritesWithSearch,
                            );
                            currentUserFavorites =
                                BlocProvider.of<SearchAboutFavoritesCubit>(
                                  context,
                                ).filteredList;
                          },
                        ),
                      ),
                      BlocBuilder<
                        SearchAboutFavoritesCubit,
                        SearchAboutFavoritesState
                      >(
                        builder: (context, state) {
                          if (state is SearchAboutFavoritesSuccess) {
                            return Expanded(
                              child: ListView.builder(
                                itemCount: snapShot.data!.length,
                                itemBuilder: (context, index) {
                                  if (currentUserFavorites.contains(
                                    snapShot.data![index].eventID,
                                  )) {
                                    return EventDetailsCard(
                                      eventDm: snapShot.data![index],
                                    );
                                  } else {
                                    return SizedBox();
                                  }
                                },
                              ),
                            );
                          } else {
                            {
                              return Text(
                                "do not founed this value",
                                style: TextStyle(color: ColorsManager.red),
                              );
                            }
                          }
                        },
                      ),
                    ],
                  );
                } else if (snapShot.hasError) {
                  return Text(snapShot.error.toString());
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              },
            ),
          );
        },
      ),
    );
  }
}
