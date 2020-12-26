import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_new_year/application/congrats/congrats_cubit.dart';

import 'widgets/congrats_image.dart';
import 'widgets/congrats_widget.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const CongratsImage(),
          BlocBuilder<CongratsCubit, CongratsState>(
            builder: (context, state) {
              return state.maybeMap(
                showCongrats: (_) => const CongratsWidget(),
                orElse: () => Container(),
              );
            },
          ),
        ],
      ),
    );
  }
}
