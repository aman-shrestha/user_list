import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:view_user/app/modules/search/views/search_view.dart';
import 'package:view_user/app/modules/user_add/views/user_add_view.dart';
import 'package:view_user/app/modules/user_detail/views/user_detail_view.dart';
import 'package:view_user/app/modules/user_list/views/user_detail.dart';

import '../controllers/user_list_controller.dart';

class UserListView extends StatelessWidget {
  const UserListView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserListController());

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text("User List"),
        actions: [
          GestureDetector(
            onTap: () {
              Get.to(UserAddView());
            },
            child: Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.grey.withOpacity(0.1)),
              child: Row(
                children: [
                  Text(
                    "Add User",
                    style: TextStyle(),
                  ),
                  SizedBox(width: 10),
                  Icon(
                    Icons.add,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(width: 20),
        ],
      ),
      body: Obx(() {
        if (controller.isNoticeLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        final model = controller.noticeList.value;

        return SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {
                  Get.to(SearchView());
                },
                child: AbsorbPointer(
                  //prevents keyboard from opening
                  child: TextField(
                    // controller: searchController,
                    decoration: InputDecoration(
                      hintText: "Search Users ...",
                      prefixIcon: const Icon(Icons.search),

                      // // labelText: 'Tap to show the keyboard',
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Container(
                padding: EdgeInsets.all(10),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    UserListReusableRow(
                      title: "Page: ",
                      subtitle: "${model.page} / ${model.totalPages}",
                    ),
                    SizedBox(height: 10),
                    UserListReusableRow(
                      title: "Per Page: ",
                      subtitle: "${model.perPage}",
                    ),
                    SizedBox(height: 10),
                    UserListReusableRow(
                      title: "Total Users: ",
                      subtitle: "${model.total}",
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: model.data?.length ?? 0,
                // separatorBuilder: (_, __) => const Divider(),
                itemBuilder: (context, index) {
                  final user = model.data![index];
                  return GestureDetector(
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        shape: const RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.vertical(top: Radius.circular(20)),
                        ),
                        isScrollControlled:
                            false, // keep it false for compact size
                        builder: (BuildContext context) {
                          return UserDetailView(user: user);
                        },
                      );
                    },
                    child: Container(
                      margin: EdgeInsets.only(bottom: 20),
                      padding: EdgeInsets.fromLTRB(10, 20, 10, 20),
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.1), // Shadow color
                            blurRadius: 8.0, // Shadow blur
                            offset: Offset(
                                0, 4), // Shadow offset (horizontal, vertical)
                          ),
                        ],
                        color: Colors.grey.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Row(
                        children: [
                          Container(
                            height: 50.0, // Set your desired height
                            width: 50.0, // Set your desired width
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                            ),
                            child: CircleAvatar(
                              backgroundImage: NetworkImage(user.avatar ?? ''),
                            ),
                          ),
                          SizedBox(width: 10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${user.firstName} ${user.lastName}',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(user.email ?? ''),
                            ],
                          ),
                          Spacer(),
                          Icon(
                            Icons.visibility_outlined,
                            color: Colors.grey,
                          )
                        ],
                      ),
                    ),
                    // ListTile(
                    //   leading: CircleAvatar(
                    //     backgroundImage: NetworkImage(user.avatar ?? ''),
                    //   ),
                    //   title: Text('${user.firstName} ${user.lastName}'),
                    //   subtitle: Text(user.email ?? ''),
                    // ),
                  );
                },
              ),
              // const SizedBox(height: 24),
              // if (model.support != null) ...[
              //   const Divider(),
              //   Text(
              //     "Support Info:",
              //     style: Theme.of(context).textTheme.titleMedium,
              //   ),
              //   Text("URL: ${model.support!.url ?? ''}"),
              //   Text("Text: ${model.support!.text ?? ''}"),
              // ]
            ],
          ),
        );
      }),
    );
  }
}

class UserListReusableRow extends StatelessWidget {
  final String title;
  final String subtitle;
  const UserListReusableRow(
      {super.key, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Text(
          subtitle,
          style: TextStyle(color: Colors.grey),
        ),
      ],
    );
  }
}
