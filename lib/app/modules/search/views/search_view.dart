import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../user_list/controllers/user_list_controller.dart';
import '../../user_list/views/user_detail.dart';
import '../controllers/search_controller.dart';

class SearchView extends StatelessWidget {
  final controller = Get.put(UserListController());
  final searchController = TextEditingController();
  var searchResult = [].obs;
  SearchView({super.key});
  @override
  Widget build(BuildContext context) {
    void searchQuery(String query) {
      final allUsers = controller.noticeList.value.data ?? [];

      if (query.isEmpty) {
        searchResult.clear();
      } else {
        final filtered = allUsers
            .where((user) =>
                user.firstName!.toLowerCase().contains(query.toLowerCase()))
            .toList();
        searchResult.value = filtered;
      }
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.white,
        title: TextField(
          controller: searchController,
          style: const TextStyle(
            color: Colors.black, // Make sure text color is visible
            fontSize: 16,
          ),
          decoration: InputDecoration(
            hintText: "searchUsers".tr,
            hintStyle: TextStyle(color: Colors.grey[600]),
            prefixIcon: Icon(Icons.search, color: Colors.grey[600]),
            border: InputBorder.none,
          ),
          onChanged: (value) {
            searchQuery(value);
          },
        ),
        centerTitle: false,
      ),
      body: Obx(
        () {
          return Padding(
              padding: const EdgeInsets.all(16.0),
              child: searchResult.isEmpty
                  ? Center(
                      child: Text(
                        'noResultsFound'.tr,
                        style: TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                    )
                  : ListView.builder(
                      shrinkWrap: true,
                      itemCount: searchResult.length,
                      itemBuilder: (context, index) {
                        final user = searchResult[index];
                        return GestureDetector(
                          onTap: () {
                            showModalBottomSheet(
                              context: context,
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(20)),
                              ),
                              isScrollControlled:
                                  false, // keep it false for compact size
                              builder: (BuildContext context) {
                                return UserDetailView(user: user);
                              },
                            );
                          },
                          child: ListTile(
                            leading: CircleAvatar(
                              backgroundImage: NetworkImage(user.avatar ?? ''),
                            ),
                            title: Text('${user.firstName} ${user.lastName}'),
                            subtitle: Text(user.email ?? ''),
                          ),
                        );
                      },
                    ));
        },
      ),
      // Obx(() {
      //   if (controller.isLoading.value) {
      //     return const Center(child: CircularProgressIndicator());
      //   }

      //   final List<Data> users =
      //       searchResult.isEmpty && searchController.text.isEmpty
      //           ? controller.noticeList.value.data ?? []
      //           : searchResult;

      //   return Padding(
      //     padding: const EdgeInsets.all(16),
      //     child: Column(
      //       children: [
      //         TextField(
      //           controller: searchController,
      //           onChanged: searchQuery,
      //           decoration: const InputDecoration(
      //             hintText: 'Search by first name',
      //             prefixIcon: Icon(Icons.search),
      //             border: OutlineInputBorder(),
      //           ),
      //         ),
      //         const SizedBox(height: 20),
      //         Expanded(
      //           child: ListView.builder(
      //             itemCount: users.length,
      //             itemBuilder: (context, index) {
      //               final user = users[index];
      //               return ListTile(
      //                 leading: CircleAvatar(
      //                   backgroundImage: NetworkImage(user.avatar ?? ''),
      //                 ),
      //                 title: Text('${user.firstName} ${user.lastName}'),
      //                 subtitle: Text(user.email ?? ''),
      //               );
      //             },
      //           ),
      //         ),
      //       ],
      //     ),
      //   );
      // }),
    );
  }
}
