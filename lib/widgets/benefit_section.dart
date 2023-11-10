import 'package:amcmotion/widgets/line_divider.dart';
import 'package:flutter/material.dart';

Widget benefitSection(context) {
  MediaQueryData deviceInfo = MediaQuery.of(context);
  double screenWidth = deviceInfo.size.width;
  String benefitOne = 'Your members, employees, clients, and neighbors deserve '
    'proper access to all forms of care and supportive services. Especially '
    'when the unmet need for care is brain/behavioral health-related. '
    'Participating organizations in other communities have seen a significant '
    'increase in referrals. For example, one organization reported a 90% '
    'increase in referrals within the first 90 days. The 90 by 90 benefit!';

  String benefitTwo = 'Despite the CDC report that 87% of Americans have a '
  '“usual” place to go for medical care, rural hospitals are operating at an '
  'extreme disadvantage. They treat more uninsured individuals and have more '
  'patients with complex chronic diseases, multiple health issues, and '
  'socioeconomic disadvantages. When access to healthcare and health-related '
  'social services are aligned, the cost of care is optimal. When it is not, '
  'patients, healthcare providers, and hospitals suffer.';

  String benefitThree = 'This initiative will help more underprivileged '
  'community members get the care they need when they need it with compassion '
  'and respect, especially those with brain/behavioral health Issues. '
  'AccessMeCare™ personalizes the experience for each user based on their '
  'specific health, social, education, and economic needs. Individuals gain '
  'direct access to the most appropriate set of community-based services that '
  'can help them improve their quality of life as well as their health and '
  'educational outcomes.';

  return Center(
      child: Container(
        color: const Color(0xFFFAFAFA),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget> [
            Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                child: SizedBox(
                  width: screenWidth - 40,
                  child: Text(
                    'How You Benefit from this Important Initiative',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.titleLarge
                  ),
                ),
              ),
            ],
          ),
          // Benefit One
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                child: SizedBox(
                  width: screenWidth - 40,
                  child: RichText(
                    text: TextSpan(
                      children: [
                        const WidgetSpan(
                          child: Icon(
                            Icons.star_rate,
                            size: 26,
                            color: Colors.lightBlue
                          ),
                        ),
                        TextSpan(
                          text: " Community Based Organizations – 90 by 90",
                          style: Theme.of(context).textTheme.titleMedium
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                child: SizedBox(
                  width: screenWidth - 70,
                  child: Text(
                    benefitOne,
                    textAlign: TextAlign.justify,
                    style: Theme.of(context).textTheme.bodyMedium
                  ),
                ),
              ),
            ],
          ),
          // Benefit Two
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                child: SizedBox(
                  width: screenWidth - 40,
                  child: RichText(
                    text: TextSpan(
                      children: [
                        const WidgetSpan(
                          child: Icon(
                              Icons.star_rate,
                              size: 26,
                              color: Colors.lightBlue
                          ),
                        ),
                        TextSpan(
                            text: " Hospitals and Healthcare Providers",
                            style: Theme.of(context).textTheme.titleMedium),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                child: SizedBox(
                  width: screenWidth - 70,
                  child: Text(
                      benefitTwo,
                      textAlign: TextAlign.justify,
                      style: Theme.of(context).textTheme.bodyMedium
                  ),
                ),
              ),
            ],
          ),
            // Benefit Three
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                child: SizedBox(
                  width: screenWidth - 40,
                  child: RichText(
                    text: TextSpan(
                      children: [
                        const WidgetSpan(
                          child: Icon(
                              Icons.star_rate,
                              size: 26,
                              color: Colors.lightBlue
                          ),
                        ),
                        TextSpan(
                            text: " The People in Your Community",
                            style: Theme.of(context).textTheme.titleMedium
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                child: SizedBox(
                  width: screenWidth - 70,
                  child: Text(
                      benefitThree,
                      textAlign: TextAlign.justify,
                      style: Theme.of(context).textTheme.bodyMedium
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
                child: InkWell(
                  onTap: () {
                  },
                  child: const Center(
                    child: Icon(
                      Icons.arrow_circle_down,
                      color: Colors.lightBlue,
                      size: 30.0,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ]
      ),
    ),
  );
}