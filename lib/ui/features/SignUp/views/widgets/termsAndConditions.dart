import 'package:flutter/material.dart';

import '../../../../../design_system/parameters/colors.dart';

class ViewTermsAndConditions extends StatefulWidget {
  final String termsAndConditions;
  const ViewTermsAndConditions({Key? key, required this.termsAndConditions}) : super(key: key);

  @override
  State<ViewTermsAndConditions> createState() => _ViewTermsAndConditionsState();
}

bool isLoading = true;
class _ViewTermsAndConditionsState extends State<ViewTermsAndConditions> {

  @override
  Widget build(BuildContext context) {

    double screenWidth = MediaQuery.of(context).size.width;
    double radius = 24;
    return Dialog(

      elevation: 40,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius)
      ),
      child: Builder(
        builder: (context) {
          return SizedBox(
            width: screenWidth,
            child: Column(
              children: [
                const SizedBox(height: 40,),
                const Text('Aceite os termos e condiçōes\n para se cadastrar!!!',
                  textAlign: TextAlign.center ,
                  style: TextStyle(color: DSColors.primary,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),

                Expanded(
                  child: Stack(
                      children: <Widget>[
                        SingleChildScrollView(
                          child: Column(
                            children: [
                              ConstrainedBox(
                                  constraints: const BoxConstraints(
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Text(widget.termsAndConditions),
                                  )
                              ),
                            ],
                          ),
                        ),
                      ]
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TextButton(onPressed: (){

                        Navigator.of(context).pop();
                      },
                        child: Container(
                          decoration: const BoxDecoration(
                              color: DSColors.primary,
                              borderRadius: BorderRadius.all(Radius.circular(20))
                          ),
                          constraints:  BoxConstraints(
                                maxWidth: screenWidth*.60, minHeight: 50.0),
                            alignment: Alignment.center,
                            child: const Text(
                              'OK',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }

  void viewTermsAndConditions(context) => showDialog(
    context: context,
    builder: (context) => const Center(child: CircularProgressIndicator()),
  );
}


