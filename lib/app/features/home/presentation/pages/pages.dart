import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:juntos_app/app/core/domain/usecases/usecases.dart';
import 'package:juntos_app/app/core/presentation/cubit/navigation_bar/navigation_bar_cubit.dart';
import 'package:juntos_app/app/core/presentation/widgets/widgets.dart';
import 'package:juntos_app/app/core/utils/utils.dart';
import 'package:juntos_app/app/features/benefits/benefits.dart';
import 'package:juntos_app/app/features/board/board.dart';
import 'package:juntos_app/app/features/giveaways/giveaways.dart';
import 'package:juntos_app/app/features/home/domain/usecases/usecases.dart';
import 'package:juntos_app/app/features/home/presentation/cubit/home_cubit.dart';
import 'package:juntos_app/app/features/home/presentation/widgets/widgets.dart';
import 'package:juntos_app/app/features/notifications/notifications.dart';
import 'package:juntos_app/app/features/radio/radio.dart';
import 'package:juntos_app/injection_container.dart';

part 'home_page.dart';
