// import 'package:flutter/material.dart';
// import 'package:leqahy/UI/screen/lab_vaccine_screen.dart';
// import 'package:leqahy/UI/widget/custom_wigets/custom_icon.dart';
// import 'package:leqahy/UI/widget/custom_wigets/custom_text.dart';
// import 'package:leqahy/constant/colors.dart';
// import 'package:leqahy/viewmodel/lab_vaccine_screen_viewmodel/lab_vaccine_screen_viewmodel.dart';

// import '../../../constant/constant.dart';
// import '../../../model/lab_vaccine_models/lab_vaccine.dart';
// import '../../../services/lab_vaccine_services/lab_vaccine_service.dart';

// labDropDownItems(
//     {required dynamic size,
//     required String categoryText,
//     required bool view,
//     required Function() onTapCate,
//     required bool selectItem,
//     required void Function(bool?) onChangedCheckBox}) {
//   LabVaccineScreenViewModel _vm = LabVaccineScreenViewModel();

//   return Container(
//     width: size.width * 0.8,
//     child: Column(
//       children: [
//         ListTile(
//           dense: true,
//           selected: true,
//           enabled: true,
//           selectedColor: Colors.red,
//           mouseCursor: MouseCursor.uncontrolled,
//           hoverColor: Colors.red,
//           title: CustomText(
//               text: categoryText,
//               fontSize: size.width * 0.05,
//               color: Colors.grey[500],
//               fontWeight: FontWeight.bold),
//           trailing: customIcon(
//               click: true,
//               icon: view ? _vm.dropDownArrowUp : _vm.dropDownArrowDown,
//               iconColor: darkBlueColor,
//               onTap: onTapCate),
//         ),
//         if (view)
//           FutureBuilder(
//             future: LabVaccineApi().fetctVaccine('1'),
//             builder: (context, snapshot) {
//               if (snapshot.hasData) {
//                 return Container(
//                   height: size.height * 0.3,
//                   child: ListView.builder(
//                       itemCount: snapshot.data!.length,
//                       shrinkWrap: true,
//                       itemBuilder: (context, index) {
//                         if (snapshot.data![index].productTypeName! ==
//                             categoryText) {
//                           _vm.checkMap[snapshot.data![index].name!] = false;
//                           print(_vm.checkMap);
//                           return CheckboxListTile(
//                             title: Text(snapshot.data![index].name!),
//                             value: _vm.checkMap[snapshot.data![index].name!],
//                             onChanged: (value) {
//                               _vm.checkMap[snapshot.data![index].name!] =
//                                   value ?? false;
//                             },
//                           );
//                         } else {
//                           return Container();
//                         }
//                       }),
//                 );
//               } else {
//                 return const Center(
//                   child: CircularProgressIndicator(),
//                 );
//               }
//             },
//           ),
//       ],
//     ),
//   );
// }
