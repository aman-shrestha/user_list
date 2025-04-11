import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:view_user/app/modules/user_list/model/user_list_model.dart';

import '../../user_list/controllers/user_list_controller.dart';
import '../controllers/user_detail_controller.dart';

// class UserDetailView extends StatelessWidget {
//   final Data user;
//   const UserDetailView({super.key, required this.user});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('User Detail'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16),
//         child: Card(
//           shape:
//               RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
//           elevation: 4,
//           child: Padding(
//             padding: const EdgeInsets.all(24),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 CircleAvatar(
//                   radius: 50,
//                   backgroundImage: NetworkImage(user.avatar ?? ''),
//                 ),
//                 const SizedBox(height: 20),
//                 Text(
//                   '${user.firstName} ${user.lastName}',
//                   style: const TextStyle(
//                       fontSize: 22, fontWeight: FontWeight.bold),
//                 ),
//                 const SizedBox(height: 10),
//                 Text('Email: ${user.email}'),
//                 const SizedBox(height: 10),
//                 Text('ID: ${user.id}'),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
