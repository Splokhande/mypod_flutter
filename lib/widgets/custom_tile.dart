import 'package:mypod_flutter/import_helper.dart';

customTile() {
  return ConstrainedBox(
    constraints: BoxConstraints(
      maxWidth: 80.w,
      minWidth: 40.w,
    ),
    child: Row(
      children: [
        const CircleAvatar(
          maxRadius: 15,
          backgroundImage:
              NetworkImage('https://picsum.photos/200/300', scale: 50),
        ),
        SizedBox(
          width: 2.w,
        ),
        customText(msg: 'Saiprasad Lokhande', fontSize: 10.sp),
      ],
    ),
  );
}

Widget circularIcon(
    {required String msg, required IconData icon, VoidCallback? onTap}) {
  return GestureDetector(
    onTap: onTap ?? () {},
    child: Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        circleIcon(icon),
        SizedBox(
          height: 1.h,
        ),
        customText(msg: msg, fontSize: 8.sp)
      ],
    ),
  );
}

Widget circleIcon(IconData icon) {
  return Container(
    width: 17.w,
    height: 7.h,
    padding: const EdgeInsets.all(4),
    decoration:
        const BoxDecoration(color: kLightPrimaryColor, shape: BoxShape.circle),
    child: Center(
      child: Icon(icon, color: kFontColor, size: 15.sp),
    ),
  );
}

Widget circleImg({String? image, double? width, double? height}) {
  return Container(
    width: width ?? 17.w,
    height: height ?? 7.h,
    padding: const EdgeInsets.all(4),
    decoration:
        const BoxDecoration(color: kLightPrimaryColor, shape: BoxShape.circle),
    child: Center(
      child: CachedNetworkImage(
        imageUrl: image!,
        placeholder: (context, url) => const CircularProgressIndicator(),
        errorWidget: (context, url, error) => const Icon(Icons.error),
      ),
    ),
  );
}

Widget customBoxTile({
  bool iconInLead = false,
  required String title,
  required String subtitle,
  required IconData icon,
}) {
  return Container(
    width: 90.w,
    height: 10.h,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        border: Border.all(color: kTitleColor, width: 1),
        gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: iconInLead
                ? [kFontColor, Colors.transparent]
                : [Colors.transparent, kFontColor],
            stops: iconInLead ? [0.0, 0.5] : [0.5, 1.0])),
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (iconInLead) Icon(icon, color: kTitleColor, size: 18.sp),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment:
                iconInLead ? CrossAxisAlignment.end : CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              customText(msg: title, color: kFontColor),
              customText(msg: subtitle, color: kSubtitleColor, fontSize: 8.sp),
            ],
          ),
          if (!iconInLead) Icon(icon, color: kTitleColor, size: 18.sp),
        ],
      ),
    ),
  );
}

Widget receiptCard({
  String? name,
  String? roomNo,
  String? date,
  bool paymentModeIsOnline = false,
  String? maintainanceAmount,
  String? finalAmount,
  String? vehicleCharge,
  String? penalty,
  bool status = false,
}) {
  return Container(
    height: 30.h,
    width: 100.w,
    padding: const EdgeInsets.all(8),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        border: Border.all(color: kTitleColor, width: 1),
        gradient: LinearGradient(
            colors: status
                ? [Colors.transparent, kFontColor]
                : [Colors.transparent, Colors.red],
            stops: [0.4, 1.0],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight)),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        customText(msg: name!),
        customText(msg: 'Room no: ${roomNo!}', fontSize: 8.sp),
        customText(msg: 'Maintenance ${maintainanceAmount!}', fontSize: 8.sp),
        customText(msg: 'Vehicle charge: ${vehicleCharge!}', fontSize: 8.sp),
        customText(msg: 'Penalty: ${penalty!}', fontSize: 8.sp),
        customText(msg: 'Final Amount: ${finalAmount!}', fontSize: 8.sp),
        customText(
            msg: 'Paid: ${paymentModeIsOnline ? 'Online' : 'Cash'}',
            fontSize: 8.sp),
      ],
    ),
  );
}
