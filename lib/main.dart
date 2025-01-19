import 'package:assesment_app/presentation/trending/trending_screen.dart';
import 'package:assesment_app/presentation/trending/trending_view_model.dart';
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
        ChangeNotifierProvider(create: (context) => TrendingViewModel()),
      ],
      child: ScreenUtilInit(
          designSize: const Size(480, 854),
          useInheritedMediaQuery: true,
          minTextAdapt: true,
          builder: (context, child) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Assessment App',
            home: TrendingScreen(),
            );
          }),
    );
  }
}
