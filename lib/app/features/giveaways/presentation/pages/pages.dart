import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:juntos_app/app/core/presentation/widgets/widgets.dart';
import 'package:juntos_app/app/core/utils/utils.dart';
import 'package:juntos_app/app/features/giveaways/domain/entities/entities.dart';
import 'package:juntos_app/app/features/giveaways/domain/usecases/usecases.dart';
import 'package:juntos_app/app/features/giveaways/presentation/cubit/giveaway_invite/giveaway_invite_cubit.dart';
import 'package:juntos_app/app/features/giveaways/presentation/cubit/giveaways/giveaways_cubit.dart';
import 'package:juntos_app/app/features/giveaways/presentation/widgets/widgets.dart';
import 'package:juntos_app/injection_container.dart';
import 'package:juntos_app/l10n/l10n.dart';

part 'giveaway_detail_page.dart';
part 'giveaway_invite_page.dart';
part 'giveaways_page.dart';
