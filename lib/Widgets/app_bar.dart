
// import 'package:artracker/screens/ar_agent.dart';
import 'package:artracker/Widgets/top_menu_bar.dart';
import 'package:flutter/material.dart';
import 'package:artracker/providers/theme_provider.dart';
// import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:provider/provider.dart';



class AppBarCommon extends StatelessWidget implements PreferredSizeWidget{
  const AppBarCommon({
    super.key,
  });

  @override
  // TODO: implement preferredSize
 Size get preferredSize => const Size.fromHeight(kToolbarHeight); 
  
  @override
  Widget build(BuildContext context) {
    return AppBar(
        title: Row(
          mainAxisSize: MainAxisSize.max,
          children: const [
            Expanded(
              child: TopMenuBar(),
            ),
          ],
        ),
        actions: [
        IconButton(
          onPressed: () {
            final themeNotifier = context.read<ThemeProvider>();
            final currentMode = themeNotifier.themeMode;
            themeNotifier.themeMode = currentMode == ThemeMode.dark
                ? ThemeMode.light
                : ThemeMode.dark;
          },
          icon: Icon(
            context.watch<ThemeProvider>().themeMode == ThemeMode.dark 
                ? Icons.light_mode_rounded // Use a sun icon when in dark mode
                : Icons
                    .dark_mode_rounded, // Use a moon icon when in light mode
          ),
        ),
      ],
      );
  }
}