import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:leqahy/constant/colors.dart';
import 'package:circular_profile_avatar/circular_profile_avatar.dart';

import '../../../constant/constant.dart';

iconStack(
    {required String avatarimage,
    required String image,
    Function()? onTap,
    required bool imagefromAsset}) {
  return CircleAvatar(
    maxRadius: 25,
    backgroundImage: AssetImage(image),
    backgroundColor: whiteColor,
    child: InkWell(
      onTap: onTap,
      child: imagefromAsset
          ? CircleAvatar(
              maxRadius: 28,
              backgroundColor: whiteColor,
              child: Image.asset(
                avatarimage,
                color: darkBlueColor,
              ),
            )
          : CircleAvatar(
              maxRadius: 28,
              backgroundColor: whiteColor,
              child: Image.network(avatarimage),
            ),
    ),
  );
}

// avatarStack({required String avatarImage, required String image}) {
//   return CircularProfileAvatar(
//     '',
//     radius: 25,
//     elevation: 2,
//     borderColor: darkBlueColor,
//     child: CircularProfileAvatar(
//       '',
//       radius: 32,
//       backgroundColor: whiteColor,
//       child: Image.asset(
//         avatarImage,
//         color: darkBlueColor,
//       ),
//     ),
//   );
// }

// Stack(
//     alignment: AlignmentDirectional.center,
//     children: [
//       Image.asset(
//         image,
//         width: avatarRadius * 3.1,
//       ),
//       Positioned(
//           bottom: 0.1,
//           child: Text(
//             text,
//             style: TextStyle(color: darkBlueColor, fontSize: fontsize),
//           )),
//       InkWell(
//         onTap: onTap,
//         child: CircleAvatar(
//           radius: avatarRadius,
//           backgroundColor: whiteColor,
//           backgroundImage: AssetImage(avatarimage),
//         ),
//       ),
//     ],
//   );