import 'package:artracker/providers/theme_provider.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TopMenuBar extends StatelessWidget {
  const TopMenuBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MenuBar(
      children: [
        SubmenuButton(
          menuChildren: [
            MenuItemButton(
              onPressed: () {
                showAboutDialog(
                  context: context,
                  applicationName: 'AR Software',
                  applicationVersion: '0.0.1',
                );
              },
              child: const MenuAcceleratorLabel('&About'),
            ),
            MenuItemButton(
              child: const MenuAcceleratorLabel(
                '&Save',
              ),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text(
                      "SAVED!",
                    ),
                  ),
                );
              },
            ),
            MenuItemButton(
              child: const MenuAcceleratorLabel(
                '&Quit',
              ),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Quit!'),
                  ),
                );
              },
            ),
          ],
          child: const MenuAcceleratorLabel(
            '&File',
          ),
        ),
        SubmenuButton(
          menuChildren: [
             SubmenuButton(menuChildren: [MenuItemButton(child: MenuAcceleratorLabel("Green",),onPressed: () => context.read<ThemeProvider>().usedScheme =
                  FlexScheme.green), MenuItemButton(child: MenuAcceleratorLabel("Aqua Blue",),onPressed: () => context.read<ThemeProvider>().usedScheme =
                  FlexScheme.aquaBlue),MenuItemButton(child: MenuAcceleratorLabel("Amber",),onPressed: () => context.read<ThemeProvider>().usedScheme =
                  FlexScheme.amber),MenuItemButton(child: MenuAcceleratorLabel("Bahama Blue",),onPressed: () => context.read<ThemeProvider>().usedScheme =
                  FlexScheme.bahamaBlue),MenuItemButton(child: MenuAcceleratorLabel("Barossa",),onPressed: () => context.read<ThemeProvider>().usedScheme =
                  FlexScheme.barossa),MenuItemButton(child: MenuAcceleratorLabel("Big Stone",),onPressed: () => context.read<ThemeProvider>().usedScheme =
                  FlexScheme.bigStone,),MenuItemButton(child: MenuAcceleratorLabel("Blue",),onPressed: () => context.read<ThemeProvider>().usedScheme =
                  FlexScheme.blue,),MenuItemButton(child: MenuAcceleratorLabel("Blue M3",),onPressed: () => context.read<ThemeProvider>().usedScheme =
                  FlexScheme.blueM3,),MenuItemButton(child: MenuAcceleratorLabel("Blue Whale",),onPressed: () => context.read<ThemeProvider>().usedScheme =
                  FlexScheme.blueWhale,),MenuItemButton(child: MenuAcceleratorLabel("Cyan M3",),onPressed: () => context.read<ThemeProvider>().usedScheme =
                  FlexScheme.cyanM3,),MenuItemButton(child: MenuAcceleratorLabel("Damask"),onPressed: () => context.read<ThemeProvider>().usedScheme =
                  FlexScheme.damask,),MenuItemButton(child: MenuAcceleratorLabel("Deep Blue"),onPressed: () => context.read<ThemeProvider>().usedScheme =
                  FlexScheme.deepBlue,),MenuItemButton(child: MenuAcceleratorLabel("Deep Orange M3"),onPressed: () => context.read<ThemeProvider>().usedScheme =
                  FlexScheme.deepOrangeM3,),MenuItemButton(child: MenuAcceleratorLabel("Deep Purple"),onPressed: () => context.read<ThemeProvider>().usedScheme =
                  FlexScheme.deepPurple,),MenuItemButton(child: MenuAcceleratorLabel("Dell Genoa"),onPressed: () => context.read<ThemeProvider>().usedScheme =
                  FlexScheme.dellGenoa,),MenuItemButton(child: MenuAcceleratorLabel("Ebony Clay"),onPressed: () => context.read<ThemeProvider>().usedScheme =
                  FlexScheme.ebonyClay,),MenuItemButton(child: MenuAcceleratorLabel("expresso"),onPressed: () => context.read<ThemeProvider>().usedScheme =
                  FlexScheme.espresso,),MenuItemButton(child: MenuAcceleratorLabel("Flutter Dash"),onPressed: () => context.read<ThemeProvider>().usedScheme =
                  FlexScheme.flutterDash,),MenuItemButton(child: MenuAcceleratorLabel("Gold"),onPressed: () => context.read<ThemeProvider>().usedScheme =
                  FlexScheme.gold,),MenuItemButton(child: MenuAcceleratorLabel("Green M3"),onPressed: () => context.read<ThemeProvider>().usedScheme =
                  FlexScheme.greenM3,),MenuItemButton(child: MenuAcceleratorLabel("Grey Law"),onPressed: () => context.read<ThemeProvider>().usedScheme =
                  FlexScheme.greyLaw,),], child: MenuAcceleratorLabel("&Themes"),),
            MenuItemButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Magnify"),
                  ),
                );
              },
              child: const MenuAcceleratorLabel(
                '&Magnify',
              ),
            ),
            MenuItemButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text(
                      "Minify",
                    ),
                  ),
                );
              },
              child: const MenuAcceleratorLabel(
                'Mi&nify',
              ),
            ),
          ],
          child: const MenuAcceleratorLabel(
            '&View',
          ),
        ),
      ],
    );
  }
}
