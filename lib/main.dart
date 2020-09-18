import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:serelization/api/post_api.dart';

import 'package:serelization/screen/ui.dart';

import 'bloc/postbloc/post_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => PostApi(),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) =>
                PostCubit(networkService: context.repository<PostApi>()),
          )
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: UT(),
        ),
      ),
    );
  }
}
