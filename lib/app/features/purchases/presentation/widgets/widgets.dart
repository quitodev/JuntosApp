import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:juntos_app/app/core/presentation/widgets/widgets.dart';
import 'package:juntos_app/app/core/theme/theme.dart';
import 'package:juntos_app/app/core/utils/utils.dart';
import 'package:juntos_app/app/features/purchases/domain/entities/entities.dart';
import 'package:juntos_app/app/features/purchases/presentation/cubit/purchases_cubit.dart';
import 'package:juntos_app/l10n/l10n.dart';

part 'purchase_detail/purchase_detail.dart';
part 'purchase_detail/purchase_payment.dart';
part 'purchases/purchase_item.dart';
part 'purchases/purchases_list.dart';
