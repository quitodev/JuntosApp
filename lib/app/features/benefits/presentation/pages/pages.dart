import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:juntos_app/app/core/presentation/widgets/widgets.dart';
import 'package:juntos_app/app/core/utils/utils.dart';
import 'package:juntos_app/app/features/benefits/domain/entities/entities.dart';
import 'package:juntos_app/app/features/benefits/domain/usecases/usecases.dart';
import 'package:juntos_app/app/features/benefits/presentation/cubit/benefit_detail/benefit_detail_cubit.dart';
import 'package:juntos_app/app/features/benefits/presentation/cubit/benefits/benefits_cubit.dart';
import 'package:juntos_app/app/features/benefits/presentation/widgets/widgets.dart';
import 'package:juntos_app/injection_container.dart';
import 'package:juntos_app/l10n/l10n.dart';

part 'benefit_detail_page.dart';
part 'benefits_page.dart';
