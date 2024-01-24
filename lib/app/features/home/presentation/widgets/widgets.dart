import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:juntos_app/app/core/presentation/cubit/navigation_bar/navigation_bar_cubit.dart';
import 'package:juntos_app/app/core/presentation/widgets/widgets.dart';
import 'package:juntos_app/app/core/theme/theme.dart';
import 'package:juntos_app/app/core/utils/utils.dart';
import 'package:juntos_app/app/features/home/presentation/cubit/home_cubit.dart';
import 'package:juntos_app/l10n/l10n.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'home_app_bar.dart';
part 'home_drawer_menu.dart';
part 'home_navigation_bar.dart';
part 'home_winner_image.dart';
