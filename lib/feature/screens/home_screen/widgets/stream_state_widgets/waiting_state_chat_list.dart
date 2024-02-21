// ignore_for_file: must_be_immutable

import 'package:card_loading/card_loading.dart';
import 'package:flutter/material.dart';

class WaitingStateChatList extends StatelessWidget {
  const WaitingStateChatList({
    super.key,
    required this.mq,
  });

  final Size mq;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: mq.width * 0.6,
                child: CardLoading(
                  height: 40,
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              SizedBox(
                  width: mq.width * 0.2,
                  child: CardLoading(
                    height: 40,
                    borderRadius: BorderRadius.circular(12),
                  ))
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(12),
          child: ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: 7,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: CardLoading(
                  borderRadius: BorderRadius.circular(12),
                  height: 10,
                  child: ListTile(),
                ),
              );
            },
          ),
        )
      ],
    );
  }
}


//  Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 12),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               SizedBox(
//                 width: mq.width * 0.6,
//                 child: CardLoading(
//                   height: 40,
//                   borderRadius: BorderRadius.circular(12),
//                 ),
//               ),
//               SizedBox(
//                   width: mq.width * 0.2,
//                   child: CardLoading(
//                     height: 40,
//                     borderRadius: BorderRadius.circular(12),
//                   ))
//             ],
//           ),
//         ),
//         Padding(
//           padding: const EdgeInsets.all(12),
//           child: ListView.builder(
//             physics: NeverScrollableScrollPhysics(),
//             shrinkWrap: true,
//             itemCount: 7,
//             itemBuilder: (context, index) {
//               return Padding(
//                 padding: const EdgeInsets.symmetric(vertical: 5),
//                 child: CardLoading(
//                   borderRadius: BorderRadius.circular(12),
//                   height: 10,
//                   child: ListTile(),
//                 ),
//               );
//             },
//           ),
//         )