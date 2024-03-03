import 'package:card_loading/card_loading.dart';
import 'package:flutter/cupertino.dart';
import 'package:mangochatapp/features/app/theme/colors_styles.dart';
import 'package:mangochatapp/constrains/widget/my_chat_tile.dart';

class NewContactLoadingWidget extends StatelessWidget {
  NewContactLoadingWidget({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: 7,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: CardLoading(
                height: 0,
                borderRadius: BorderRadius.circular(15),
                // margin: EdgeInsets.all(12),
                cardLoadingTheme: CardLoadingTheme(
                    colorOne: UIColors.greyShade200,
                    colorTwo: UIColors.greyShade300),
                child: MyChatTile(
                    onTap: () {}, userName: '', phoneNumber: '', lastMsg: null),
              ),
            );
          },
        ),
      ),
    );
  }
}
