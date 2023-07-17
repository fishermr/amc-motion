import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:auto_size_text/auto_size_text.dart';
import '../models/sdr_community_model.dart';
import 'drop_down_menu_item.dart';
import 'line_divider.dart';

String formattedPostcode(postcode) {
  RegExp regExp = RegExp(
      r'^([A-Z]{1,2}\d{1,2}[A-Z]?)\s*(\d[A-Z]{2})$'
  );
  var pureString = postcode.replaceAll(' ', '');
  var format = regExp.hasMatch(pureString);

  if(format) {
    final match = regExp.firstMatch(pureString.toUpperCase());
    return "${match?.group(1)?.padLeft(2, '0')} ${match?.group(2)?.padLeft(2, '0')}";
  } else {
    return postcode;
  }
}

Widget formSelfDirectedReferral(BuildContext context, form,
    howCanWeServeYouDropdownItems,
    contactUsDropdownItems,
    bestTimeToReachDropdownItems,
    organizationDropdownItems,
    usStatesDropdownItems) {
  MediaQueryData deviceInfo = MediaQuery.of(context);

  final sdfForm = form;

  return ReactiveForm(
    formGroup: sdfForm,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        lineDivider(context, 3.0),
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 6, 20, 0),
            child: ReactiveDropdownField<int>(
            formControlName: 'howCanWeServeYou',
            hint: const Text(
                'How can we serve you?',
              style: TextStyle(
                fontSize: 11.0,
                fontWeight: FontWeight.bold,
              )
            ),
            items: howCanWeServeYouDropdownItems,
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 6, 20, 0),
          child: ReactiveDropdownField<int>(
              formControlName: 'selectOrganization',
              hint: const Text(
                  'Please select the organization.',
                  style: TextStyle(
                    fontSize: 11.0,
                    fontWeight: FontWeight.bold,
                  )
              ),
              items: organizationDropdownItems
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 6, 20, 0),
          child: ReactiveTextField(
            formControlName: 'firstName',
            decoration: const InputDecoration(
              labelText: 'First Name',
            ),
            style: const TextStyle(
              fontSize: 11.0,
              fontWeight: FontWeight.bold,
            )
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 6, 20, 0),
          child: ReactiveTextField(
            formControlName: 'middle',
            decoration: const InputDecoration(
              labelText: 'Middle Name',
            ),
            style: const TextStyle(
              fontSize: 11.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 6, 20, 0),
          child: ReactiveTextField(
            formControlName: 'lastName',
            decoration: const InputDecoration(
              labelText: 'Last Name',
            ),
            style: const TextStyle(
              fontSize: 11.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 6, 20, 0),
          child: ReactiveTextField(
            formControlName: 'address',
            decoration: const InputDecoration(
              labelText: 'Address',
            ),
            style: const TextStyle(
              fontSize: 11.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 6, 20, 0),
          child: ReactiveTextField(
            formControlName: 'addressExt',
            decoration: const InputDecoration(
              labelText: 'Address Ext',
            ),
            style: const TextStyle(
              fontSize: 11.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 6, 20, 0),
          child: ReactiveTextField(
            formControlName: 'city',
            decoration: const InputDecoration(
              labelText: 'City',
            ),
            style: const TextStyle(
              fontSize: 11.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 6, 20, 0),
          child: ReactiveDropdownField<int>(
              formControlName: 'usStates',
              hint: const Text(
                  'Choose U.S. State',
                  style: TextStyle(
                    fontSize: 11.0,
                    fontWeight: FontWeight.bold,
                  )
              ),
              items: usStatesDropdownItems,
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 6, 20, 0),
          child: ReactiveTextField(
            formControlName: 'zipcode',
            decoration: const InputDecoration(
              labelText: 'Zipcode',
            ),
            style: const TextStyle(
              fontSize: 11.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Padding(
        padding: const EdgeInsets.fromLTRB(20, 16, 20, 0),
        child:
          ReactiveTextField(
            formControlName: 'phoneNumber',
            decoration: const InputDecoration(
              labelText: 'Phone number',
            ),
            style: const TextStyle(
              color: Color(0xFF333333),
              fontSize: 11,
              fontWeight: FontWeight.bold,
            ),
            keyboardType: TextInputType.number,
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 6, 20, 0),
          child: ReactiveTextField(
            formControlName: 'email',
            decoration: const InputDecoration(
              labelText: 'Email',
            ),
            style: const TextStyle(
              fontSize: 11.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.fromLTRB(20, 26, 20, 0),
          child:
          Text("May the organization identify themselves by Name?",
            style: TextStyle(
              color: Color(0xFF333333),
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 5, 0),
                child:
                Text("No",
                  style: TextStyle(
                    color: Color(0xFF333333),
                    fontSize: 12,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              ReactiveSwitch(
                  formControlName: 'identifyOurOrg'
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                child:
                Text("Yes",
                  style: TextStyle(
                    color: Color(0xFF333333),
                    fontSize: 12,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ]
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 6, 20, 6),
          child: ReactiveDropdownField<int>(
            formControlName: 'contactUs',
            hint: const Text(
                'Who are you contacting us about?',
                style: TextStyle(
                  fontSize: 11.0,
                  fontWeight: FontWeight.bold,
                )
            ),
            items: contactUsDropdownItems,
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 6, 20, 10),
          child: ReactiveDropdownField<int>(
            formControlName: 'bestTimeToServeYou',
            hint: const Text(
                'What is the best time to reach you?',
                style: TextStyle(
                  fontSize: 11.0,
                  fontWeight: FontWeight.bold,
                )
            ),
            items: bestTimeToReachDropdownItems,
          ),
        ),
        const Padding(
          padding: EdgeInsets.fromLTRB(20, 26, 20, 20),
          child:
          Text("I understand that this application is not to be used for urgent medical services. I understand that different agencies provide different services and benefits. Each agency must have my information to provide information to me about their services. By signing this form, I am allowing AccessMeCare to exchange this information with the agencies and organizations I selected so they may provide me with the information I requested.?",
            style: TextStyle(
              color: Color(0xFF333333),
              fontSize: 12,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic,
            ),
            textAlign: TextAlign.left,
          ),
        ),
        const Padding(
          padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: Text(
            "I agree by the above paragraph.",
            style: TextStyle(
              color: Color(0xFF333333),
              fontSize: 12,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
          child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 5, 0),
                  child:
                  Text("No",
                    style: TextStyle(
                      color: Color(0xFF333333),
                      fontSize: 12,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                ReactiveSwitch(
                    formControlName: 'consent'
                ),
                const Padding(
                  padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                  child:
                  Text("Yes",
                    style: TextStyle(
                      color: Color(0xFF333333),
                      fontSize: 12,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ]
          ),
        ),
        lineDivider(context, 3.0),
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 50),
          child: ElevatedButton(
            key: const Key('submit'),
            onPressed: () {},
            child: const Text(
              'Submit',
              style: TextStyle(
                color: Colors.white,
                fontSize: 12,
              ),
            ),
          ),
        ),
      ],
    )
  );
}
