import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        // ChangeNotifierProvider(create: (context) => LoginViewModel()),
      ],
      child: ScreenUtilInit(
          designSize: const Size(480, 854),
          useInheritedMediaQuery: true,
          minTextAdapt: true,
          builder: (context, child) {
            return const MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Realwear',
              // theme: ThemeData(
              //   fontFamily: 'PT Sans',
              //   bottomSheetTheme: const BottomSheetThemeData(
              //     backgroundColor: Colors.white,
              //     shadowColor: Colors.white,
              //     surfaceTintColor: Colors.white,
              //   ),
              //   primaryColor: const Color(0xFF787878),
              //   textTheme: TextTheme(
              //     headlineLarge: GoogleFonts.ptSans(
              //       fontSize: 33.sp,
              //       color: secondary,
              //       fontWeight: FontWeight.w700,
              //     ),
              //     headlineMedium: GoogleFonts.ptSans(
              //       fontSize: 28.sp,
              //       color: secondary,
              //       fontWeight: FontWeight.w500,
              //     ),
              //     headlineSmall: GoogleFonts.ptSans(
              //       fontSize: 24.sp,
              //       color: secondary,
              //       fontWeight: FontWeight.w400,
              //     ),
              //
              //     ///Titles are all bold but same size as body text
              //     // Title
              //     titleLarge: GoogleFonts.ptSans(
              //       fontSize: 20.sp,
              //       color: secondary,
              //       fontWeight: FontWeight.bold,
              //     ),
              //     titleMedium: GoogleFonts.ptSans(
              //       fontSize: 18.sp,
              //       color: secondary,
              //       fontWeight: FontWeight.bold,
              //     ),
              //     titleSmall: GoogleFonts.ptSans(
              //       fontSize: 16.sp,
              //       color: secondary,
              //       fontWeight: FontWeight.bold,
              //     ),
              //
              //     ///Body text are all regular weight use title if bold is needed
              //     bodyLarge: GoogleFonts.ptSans(
              //       fontSize: 20.sp,
              //       color: secondary,
              //       fontWeight: FontWeight.normal,
              //     ),
              //     bodyMedium: GoogleFonts.ptSans(
              //       fontSize: 18.sp,
              //       color: secondary,
              //       fontWeight: FontWeight.normal,
              //     ),
              //     bodySmall: GoogleFonts.ptSans(
              //       fontSize: 16.sp,
              //       color: secondary,
              //       fontWeight: FontWeight.normal,
              //     ),
              //
              //     /// Label
              //     labelLarge: GoogleFonts.ptSans(
              //       fontSize: 14.sp,
              //       color: secondary,
              //       fontWeight: FontWeight.bold,
              //     ),
              //     labelMedium: GoogleFonts.ptSans(
              //       fontSize: 12.sp,
              //       color: secondary,
              //       fontWeight: FontWeight.normal,
              //     ),
              //     labelSmall: GoogleFonts.ptSans(
              //       fontSize: 12.sp,
              //       color: secondary,
              //       fontWeight: FontWeight.normal,
              //     ),
              //   ),
              //
              //   ///Scaffold
              //   scaffoldBackgroundColor: Colors.white,
              //
              //   ///APP BAR
              //   appBarTheme: AppBarTheme(
              //       centerTitle: true,
              //       elevation: 0,
              //       backgroundColor: secondary,
              //       titleTextStyle: GoogleFonts.ptSans(
              //           fontSize: 10.sp,
              //           fontWeight: FontWeight.w600,
              //           color: greyText)),
              //
              //   ///Elevated Button
              //   elevatedButtonTheme: ElevatedButtonThemeData(
              //       style: ElevatedButton.styleFrom(
              //     shape: RoundedRectangleBorder(
              //       // side: BorderSide(color: primary),
              //       borderRadius: BorderRadius.circular(30.0.r),
              //     ),
              //     fixedSize: Size(130.w, 40.h),
              //     foregroundColor: onPrimary,
              //     elevation: 0,
              //     animationDuration: const Duration(milliseconds: 700),
              //     backgroundColor: primary,
              //     textStyle: GoogleFonts.ptSans(
              //         fontWeight: FontWeight.w400,
              //         color: onPrimary,
              //         fontSize: 8.sp),
              //   )),
              //
              //   ///Divider
              //   dividerTheme: DividerThemeData(
              //     thickness: 1,
              //     color: secondary,
              //   ),
              //
              //   ///Icon
              //   iconTheme: const IconThemeData(color: Color(0xFF272B35)),
              //
              //   ///Input Decoration
              //   inputDecorationTheme: InputDecorationTheme(
              //     hintStyle: TextStyle(
              //         fontWeight: FontWeight.w400,
              //         color: const Color(0xFF666666).withOpacity(0.5),
              //         fontSize: 8.sp),
              //     filled: true,
              //     fillColor: onPrimary,
              //     prefixIconColor: const Color(0xFF666666),
              //     suffixIconColor: const Color(0xFF535353),
              //     border: OutlineInputBorder(
              //       // borderRadius: BorderRadius.circular(500.r),
              //       borderSide: const BorderSide(
              //         color: Colors.transparent,
              //       ),
              //     ),
              //     focusedBorder: OutlineInputBorder(
              //       // borderRadius: BorderRadius.circular(500.r),
              //       borderSide: const BorderSide(
              //         color: Color(0xFF070029),
              //       ),
              //     ),
              //     enabledBorder: OutlineInputBorder(
              //       // borderRadius: BorderRadius.circular(500.r),
              //       borderSide: const BorderSide(
              //         color: Colors.transparent,
              //       ),
              //     ),
              //   ),
              //   checkboxTheme: CheckboxThemeData(
              //     fillColor: MaterialStateProperty.resolveWith(
              //       (Set<MaterialState> states) {
              //         if (states.contains(MaterialState.selected)) {
              //           return const Color(0xFF070029); // Color when checked
              //         }
              //         return const Color(0xFFFFFFFF); // Color when unchecked
              //       },
              //     ),
              //   ),
              // ),
              // home: LoginScreen(),
            );
          }),
    );
  }
}
