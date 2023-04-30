import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:leqahy/model/lab_vaccine_models/lab_vaccine.dart';
import 'package:leqahy/services/lab_vaccine_services/lab_vaccine_service.dart';

// showVaccine() {
//   List name = [];
//   return FutureBuilder<List<LabVaccine>>(
//       future: LabVaccineApi().fetctVaccine(languageId: '1'),
//       builder: (context, snapShot) {
//         if (snapShot.hasData) {
//           return ListView.builder(
//               itemCount: snapShot.data!.length,
//               itemBuilder: (context, index) {
//                 name.toSet().add(snapShot.data![index].productTypeName);
//                 print(name);
//                 return ExpansionPanelList(children: snapShot.data!.map((e) {
//                   return ExpansionPanel(headerBuilder: (context, isExpanded) {
                    
//                   }, body: )
//                 },).toList());
//               });
//         } else {
//           return const Center(child: CircularProgressIndicator());
//         }
//       });


  
// }

  /*
  Expanded(
              child: FutureBuilder<List<VaccineModel>>(
                  future: VaccinationAPI().getVaccine(
                      languageId: context.locale == const Locale('en', 'US')
                          ? '1'
                          : '2'),
                  builder: (context, snapShot) {
                    if (snapShot.hasData) {
                      final detected = snapShot.data!
                          .map((e) => e.productTypeName)
                          .toSet()
                          .toList();
                      return SingleChildScrollView(
                        child: Column(
                          children: [
                            vaccineContent(
                                size: size,
                                controller: cusNameControllor,
                                text: 'Customer Name'.tr(),
                                hint: 'Customer name'.tr(),
                                isReadOnly: true,
                                isSuffix: false),
                            vaccineContent(
                                size: size,
                                controller: cusNumberControllor,
                                text: 'Customer Phone'.tr(),
                                hint: 'Customer phone'.tr(),
                                isReadOnly: true,
                                isSuffix: false),
                            vaccineContent(
                                size: size,
                                controller: labControllor,
                                text: 'Lab'.tr(),
                                hint: 'Lab'.tr(),
                                isReadOnly: false,
                                isSuffix: false),
                            vaccineContent(
                                size: size,
                                controller: countDControllor,
                                text: 'Number'.tr(),
                                hint: 'Number'.tr(),
                                isReadOnly: false,
                                isSuffix: false),
                            vaccineContent(
                              size: size,
                              controller: dateControllor,
                              text: 'Date'.tr(),
                              hint: 'Date'.tr(),
                              isReadOnly: true,
                              isSuffix: true,
                              onPressed: () => pickDate(),
                            ),
                            vaccineContent(
                              size: size,
                              controller: resrveControllor,
                              text: 'Reservation Name'.tr(),
                              hint: 'Reservation Name'.tr(),
                              isReadOnly: false,
                              isSuffix: false,
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(
                                  horizontal: size.width * 0.12,
                                  vertical: size.height * 0.010),
                              height: 40,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: darkGrey),
                              child: Center(
                                child: Text(
                                  'Transactions'.tr(),
                                  style: MyTheme.lightTheme.textTheme.bodyText2!
                                      .copyWith(fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: size.width * 0.12),
                              child: ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: detected.length,
                                  physics:
                                      const AlwaysScrollableScrollPhysics(),
                                  itemBuilder: (context, index) {
                                    var named = detected[index];
                                    return ExpansionTile(
                                      title: Text(
                                        named!,
                                        style: MyTheme
                                            .lightTheme.textTheme.subtitle1!
                                            .copyWith(color: Colors.grey[600]),
                                      ),
                                      children: [
                                        ...snapShot.data!
                                            .map((e) => named !=
                                                    e.productTypeName
                                                ? const SizedBox()
                                                : CheckboxListTile(
                                                    controlAffinity: context
                                                                .locale ==
                                                            const Locale(
                                                                'en', 'US')
                                                        ? ListTileControlAffinity
                                                            .platform
                                                        : ListTileControlAffinity
                                                            .leading,
                                                    title: Text(e.name!),
                                                    value:
                                                        values[e.name] ?? false,
                                                    onChanged: (newValue) {
                                                      setState(() {
                                                        values[e.name!] =
                                                            newValue!;
                                                        subDetails.add({
                                                          "item_name": e.name
                                                        });
                                                      });
                                                      print(subDetails);
                                                    }))
                                            .toSet()
                                            .toList()
                                      ],
                                    );
                                  }),
                            ),
                          ],
                        ),
                      );
                    } else {
                      return loading();
                    }
                  }),
            ),
  */
