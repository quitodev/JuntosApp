part of 'widgets.dart';

class RegistrationModalContent extends StatelessWidget {
  const RegistrationModalContent({
    required this.buildContext,
    required this.modal,
    required this.items,
    super.key,
  });

  final BuildContext buildContext;
  final Modal modal;
  final List<dynamic> items;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          const _RegistrationModalTitle(),
          const SizedBox(
            height: 16,
          ),
          _RegistrationModalList(
            buildContext: buildContext,
            modal: modal,
            items: items,
          ),
        ],
      ),
    );
  }
}

class _RegistrationModalTitle extends StatelessWidget {
  const _RegistrationModalTitle();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = context.l10n;

    return CustomText(
      text: l10n.selectAnOption,
      fontSize: 16.spMax,
      fontWeight: FontWeight.bold,
      color: theme.colorScheme.onBackground,
      textAlign: TextAlign.center,
    );
  }
}

class _RegistrationModalList extends StatelessWidget {
  const _RegistrationModalList({
    required this.buildContext,
    required this.modal,
    required this.items,
  });

  final BuildContext buildContext;
  final Modal modal;
  final List<dynamic> items;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        shrinkWrap: true,
        itemCount: items.length,
        separatorBuilder: (context, index) {
          return Container(
            height: 1,
            color: AppColors.itemDrawerDivider,
          );
        },
        itemBuilder: (context, index) {
          return _RegistrationModalItem(
            buildContext: buildContext,
            modal: modal,
            items: items,
            index: index,
          );
        },
      ),
    );
  }
}

class _RegistrationModalItem extends StatelessWidget {
  const _RegistrationModalItem({
    required this.buildContext,
    required this.modal,
    required this.items,
    required this.index,
  });

  final BuildContext buildContext;
  final Modal modal;
  final List<dynamic> items;
  final int index;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final text = modal == Modal.departments
        ? (items[index] as Department).name
        : modal == Modal.provinces
            ? (items[index] as Province).name
            : modal == Modal.districts
                ? (items[index] as District).name
                : (items[index] as Institution).label;

    return ListTile(
      title: CustomText(
        text: text,
        fontSize: 16.spMax,
        fontWeight: FontWeight.bold,
        color: theme.colorScheme.onBackground,
        textAlign: TextAlign.center,
      ),
      onTap: () {
        if (modal == Modal.departments) {
          BlocProvider.of<RegistrationCubit>(buildContext)
              .writeDepartment((items[index] as Department).id);
        } else if (modal == Modal.provinces) {
          BlocProvider.of<RegistrationCubit>(buildContext)
              .writeProvince((items[index] as Province).id);
        } else if (modal == Modal.districts) {
          BlocProvider.of<RegistrationCubit>(buildContext)
              .writeDistrict((items[index] as District).id);
        } else {
          BlocProvider.of<RegistrationCubit>(buildContext)
              .writeInstitution((items[index] as Institution).id);
        }
        context.pop();
      },
    );
  }
}
