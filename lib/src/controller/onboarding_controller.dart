import 'package:pet_other_palace/src/models/models.dart';

final onboardingModel onBoardingData1 = onboardingModel(
    title: 'You have free time?',
    subtitle: 'give the pets a walk',
    bodyData:
        'work with us, find a way to earn extra income by placing your rates',
    pathImage: 'assets/dog1.svg');

final onboardingModel onBoardingData2 = onBoardingData1.copyWith(
    title: 'Take care of a pet', pathImage: 'assets/person.svg');

final List<onboardingModel> lisOnboarding = [onBoardingData1, onBoardingData2];
