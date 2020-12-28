import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_new_year/congrats/application/congrats/congrats_cubit.dart';
import 'package:flutter_new_year/congrats/presentation/snowfall/sprite_snow.dart';

import 'widgets/congrats_image.dart';
import 'widgets/congrats_widget.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const Positioned.fill(child: CongratsImage()),
          SpriteSnow(),
          BlocBuilder<CongratsCubit, CongratsState>(
            builder: (context, state) {
              return state.maybeMap(
                showCongrats: (_) => const CongratsWidget(),
                showLineSuccess: (_) => const CongratsWidget(),
                orElse: () => Container(),
              );
            },
          ),
        ],
      ),
    );
  }
}
