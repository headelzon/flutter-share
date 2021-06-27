import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:my_app/cubit/main_cubit.dart';
import 'package:share_plus/share_plus.dart';

class ShareFile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(child: BlocBuilder<MainCubit, MainState>(
        builder: (context, state) {
          if (state is MainLoadingState) {
            return CupertinoButton(
                child: CupertinoActivityIndicator(), onPressed: () => null);
          } else if (state is MainReadyState) {
            return CupertinoButton.filled(
                child: Text('Share file'),
                onPressed: () async {
                  final _path = await context.read<MainCubit>().filePath;
                  Share.shareFiles([_path]);
                });
          }
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CupertinoButton.filled(
                  child: Text('Download sample PDF'),
                  onPressed: () => context.read<MainCubit>().downloadFile()),
              if (state is MainErrorState)
                Text('An error occurred while downloading file',
                    style: TextStyle(color: CupertinoColors.systemRed))
            ],
          );
        },
      )),
    );
  }
}
