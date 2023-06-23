import 'package:flutter/material.dart';

class ViewTermsAndConditions extends StatefulWidget {
  const ViewTermsAndConditions({Key? key}) : super(key: key);

  @override
  State<ViewTermsAndConditions> createState() => _ViewTermsAndConditionsState();
}

bool isLoading = true;
final _key = UniqueKey();
class _ViewTermsAndConditionsState extends State<ViewTermsAndConditions> {

  @override
  Widget build(BuildContext context) {

    String termsAndConditions ="1. Acceptance of Terms: By using the Medical Risk Prediction Application ('the Application'), you agree to be bound by these Terms of Service, which constitute a legally binding agreement between you and the Application. If you do not agree to these Terms of Service, you may not use the Application.\n\n2. Accuracy of Information: The Application generates medical risks based on basic biodata and body shape measurements provided by the user. The Application does not guarantee the accuracy of this information or the medical risks generated based on it. The information provided by the Application is for informational purposes only and is not intended to be a substitute for professional medical advice, diagnosis, or treatment.\n\n3. Privacy: The Application collects and stores personal information provided by the user, such as name, age, height, weight, waist, and hip measurements. This information is used solely for the purpose of generating medical risks and is not shared with third parties. The Application takes reasonable measures to protect the privacy and security of user information.\n\n4. Limitation of Liability: The Application is provided on an 'as is' and 'as available' basis, and the user assumes all risks associated with its use. The Application is not liable for any direct, indirect, incidental, special, or consequential damages arising from the use of the Application or the information provided by it.\n\n5. Indemnification: The user agrees to indemnify and hold harmless the Application, its affiliates, and its officers, directors, employees, and agents from any claims, damages, liabilities, and expenses arising from the use of the Application or the information provided by it.\n\n6. Modification of Terms: The Application may modify these Terms of Service at any time, and such modifications shall be effective immediately upon posting of the modified Terms of Service. By continuing to use the Application after any such modifications, the user agrees to be bound by the modified Terms of Service.\n\n7. Termination: The Application reserves the right to terminate the user's access to the Application at any time for any reason without notice.\n\n8. Governing Law: These Terms of Service shall be governed by and construed in accordance with the laws of the jurisdiction in which the Application operates, without giving effect to any principles of conflicts of law.\n\n9. Entire Agreement: These Terms of Service constitute the entire agreement between the user and the Application and supersede all prior or contemporaneous communications and proposals, whether oral or written, between the user and the Application.\n\n";

    double _screenWidth = MediaQuery.of(context).size.width;
    double radius = 24;
    return Dialog(

      elevation: 40,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius)
      ),
      child: Builder(
        builder: (context) {
          return Container(
            width: _screenWidth,
            child: Column(
              children: [
                SizedBox(height: 40,),
                Text('Aceite os termos para\nse cadastrar!!!',
                  textAlign: TextAlign.center ,
                  style: TextStyle(color: Colors.green,
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

                                    //maxWidth: screenWidth -24,
                                  ),
                                  child: Container(

                                    child: Padding(
                                      padding: EdgeInsets.all(16.0),

                                      child: Text(termsAndConditions),
                                    ),
                                  )
                              ),
                            ],
                          ),
                        ),

                         Stack(),
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
                              color: Colors.green,
                              borderRadius: BorderRadius.all(Radius.circular(20))
                          ),
                          constraints:  BoxConstraints(
                                maxWidth: _screenWidth*.60, minHeight: 50.0),
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
    builder: (context) => Center(child: const CircularProgressIndicator()),
  );
}


