import 'package:assesment_app/configs/extensions/textheme_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

import '../../configs/components/loading_widget.dart';
import '../../configs/const/colors.dart';
import '../../data/response/status.dart';

class TrendingScreen extends StatefulWidget {
  TrendingScreen({super.key});

  @override
  State<TrendingScreen> createState() => _TrendingScreenState();
}

class _TrendingScreenState extends State<TrendingScreen> {
  // AppointmentViewModel appointmentViewModel = AppointmentViewModel();

  @override
  void initState() {
    // TODO: implement initState
    // appointmentViewModel.getProgressNoteApi();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: onPrimary,
      appBar: AppBar(
        backgroundColor: secondary,
        toolbarHeight: 80.h,
        title: Text('Trending'),
      ),
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(vertical: 0.01.sh, horizontal: 0.1.sw),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            0.02.sw.verticalSpace,
            Expanded(
              child: ListView.separated(
                itemCount: 5,
                itemBuilder: (context, index) {
                  // var followupData = value.followupList.data!.list[index];
                  return Container(
                    height: 100.h,
                    padding: EdgeInsets.symmetric(horizontal: 25.w),
                    alignment: Alignment.centerLeft,
                    decoration: BoxDecoration(
                        color: primary,
                        borderRadius: BorderRadius.circular(20.r)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('followupData.patientName',
                                style: context.bodyMedium),
                            5.verticalSpace,
                            Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 4.h, horizontal: 8.w),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30.r),
                                color: Colors.white.withOpacity(0.2),
                              ),
                              child: Text('followupData.treatmentType!',
                                  style: context.bodyMedium),
                            ),
                          ],
                        ),
                        Text('followupData.leadNumber',
                            style: context.bodyMedium),
                      ],
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return const SizedBox(
                    height: 10,
                  );
                },
              ),
            ),
            // ChangeNotifierProvider<AppointmentViewModel>(
            //   create: (BuildContext context) => appointmentViewModel,
            //   child: Consumer<AppointmentViewModel>(
            //     builder: (context, value, child) {
            //       switch (value.followupList.status) {
            //         case Status.INITIAL:
            //           return Container();
            //         case Status.LOADING:
            //           return const Center(child: LoadingWidget());
            //         case Status.ERROR:
            //           return Container(
            //             height: 100,
            //             width: 100,
            //             color: Colors.red,
            //           );
            //         case Status.COMPLETED:
            //           return Expanded(
            //             child: ListView.separated(
            //               itemCount: 5,
            //               itemBuilder: (context, index) {
            //                 var followupData = value.followupList.data!.list[index];
            //                 return Container(
            //                   height: 100.h,
            //                   padding: EdgeInsets.symmetric(horizontal: 25.w),
            //                   alignment: Alignment.centerLeft,
            //                   decoration: BoxDecoration(
            //                       color: primary,
            //                       borderRadius: BorderRadius.circular(20.r)),
            //                   child: Row(
            //                     mainAxisAlignment:
            //                         MainAxisAlignment.spaceBetween,
            //                     children: [
            //                       Column(
            //                         mainAxisAlignment: MainAxisAlignment.center,
            //                         crossAxisAlignment:
            //                             CrossAxisAlignment.start,
            //                         children: [
            //                           Text(
            //                             followupData.patientName,
            //                             style: GoogleFonts.ptSans(
            //                                 fontSize: 8.sp,
            //                                 fontWeight: FontWeight.w600,
            //                                 color: secondary),
            //                           ),
            //                           5.verticalSpace,
            //                           Container(
            //                             padding: EdgeInsets.symmetric(
            //                                 vertical: 4.h, horizontal: 8.w),
            //                             decoration: BoxDecoration(
            //                               borderRadius:
            //                                   BorderRadius.circular(30.r),
            //                               color: Colors.white.withOpacity(0.2),
            //                             ),
            //                             child: Text(
            //                               followupData.treatmentType!,
            //                               style: GoogleFonts.ptSans(
            //                                   fontSize: 6.sp,
            //                                   fontWeight: FontWeight.w500,
            //                                   color: secondary),
            //                             ),
            //                           ),
            //                         ],
            //                       ),
            //                       Text(
            //                         followupData.leadNumber,
            //                         style: GoogleFonts.ptSans(
            //                             fontSize: 8.sp,
            //                             fontWeight: FontWeight.w500,
            //                             color: secondary),
            //                       ),
            //                     ],
            //                   ),
            //                 );
            //               },
            //               separatorBuilder: (BuildContext context, int index) {
            //                 return const SizedBox(
            //                   height: 10,
            //                 );
            //               },
            //             ),
            //           );
            //         default:
            //           return Container();
            //       }
            //     },
            //   ),
            // ),
          ],
        ),
      )),
    );
  }
}
