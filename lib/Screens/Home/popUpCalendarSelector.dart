import 'package:flutter/material.dart';
import 'package:virtual/Constants/Color.dart';
import 'package:virtual/Constants/Text.dart';

void ShowSelectorCalendar(BuildContext context) {
  showDialog(
    useSafeArea: true,
    barrierDismissible: false,
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        contentPadding: const EdgeInsets.all(0),
        // title: Text(
        //   "Select Date",
        //   style: const TextStyle(color: Colors.white),
        // ),

        content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10)),
                  color: Kivagreen,
                ),
                height: 50,
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Select Date",
                        style: Ksecondarytext.copyWith(
                            color: Kivawhite,
                            fontWeight: FontWeight.w400,
                            fontSize: 20),
                      ),
                      IconButton(
                          onPressed: () {
                            
                            // Navigator.pop(context);
                          },
                          icon: const Icon(
                            Icons.close,
                            color: Kivawhite,
                          ))
                    ],
                  ),
                ),
              ),
              
            ]),
        actions: [
          GestureDetector(
            onTap: () {
              // context
              //     .read<CalendarBloc>()
              //     .add(NoChangeInDynamicCalendar(context: context));
              // Navigator.pop(context);

              // setState(context){

              // } // Close the dialog
            },
            child: SizedBox(
                height: 30,
                width: 60,
                child: Center(
                    child: Text('Cancel',
                        style: Ksecondarytext.copyWith(
                            fontWeight: FontWeight.w700, fontSize: 12)))),
          ),
          GestureDetector(
            onTap: () async {
              //dates = dates.union(future_dates);
              //modifieddate.clear();
              //calling the Bloc
              //context.read<CalendarBloc>().add(ChangeCalendar(context: context));
              
              
              //Navigator.pop(context);

               // Close the dialog
            },
            child: Container(
                ),
          ),
        ],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        backgroundColor: Kivawhite,
        elevation: 5.0,
      );
    },
  );
}
