// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'error_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ValidationError _$ValidationErrorFromJson(Map<String, dynamic> json) {
  return ValidationError(
    fcmIdArray:
        (json['fcm_id'] as List<dynamic>?)?.map((e) => e as String).toList(),
    nameArray:
        (json['name'] as List<dynamic>?)?.map((e) => e as String).toList(),
    nameDetailArray: (json['user_details.name'] as List<dynamic>?)
        ?.map((e) => e as String)
        .toList(),
    emailArray:
        (json['email'] as List<dynamic>?)?.map((e) => e as String).toList(),
    mobileArray: (json['phone_number'] as List<dynamic>?)
        ?.map((e) => e as String)
        .toList(),
    mobileDetailArray: (json['user_details.phone_number'] as List<dynamic>?)
        ?.map((e) => e as String)
        .toList(),
    passwordArray:
        (json['password'] as List<dynamic>?)?.map((e) => e as String).toList(),
    slotsArray:
        (json['slots'] as List<dynamic>?)?.map((e) => e as String).toList(),
    dateOfBirthArray: (json['date_of_birth'] as List<dynamic>?)
        ?.map((e) => e as String)
        .toList(),
    dateOfBirthDetailArray:
        (json['user_details.date_of_birth'] as List<dynamic>?)
            ?.map((e) => e as String)
            .toList(),
    currentPasswordArray: (json['current_password'] as List<dynamic>?)
        ?.map((e) => e as String)
        .toList(),
    companyNameArray: (json['company_name'] as List<dynamic>?)
        ?.map((e) => e as String)
        .toList(),
    noteArray:
        (json['note'] as List<dynamic>?)?.map((e) => e as String).toList(),
    addressArray:
        (json['address'] as List<dynamic>?)?.map((e) => e as String).toList(),
    availableTimePeriodArray: (json['available_time_period'] as List<dynamic>?)
        ?.map((e) => e as String)
        .toList(),
    sportsArray:
        (json['sports'] as List<dynamic>?)?.map((e) => e as String).toList(),
    photosArray:
        (json['photos'] as List<dynamic>?)?.map((e) => e as String).toList(),
    cityIdArray:
        (json['city_id'] as List<dynamic>?)?.map((e) => e as String).toList(),
    taxArray: (json['tax'] as List<dynamic>?)?.map((e) => e as String).toList(),
    startDateArray: (json['start_date'] as List<dynamic>?)
        ?.map((e) => e as String)
        .toList(),
    startTimeArray: (json['start_time'] as List<dynamic>?)
        ?.map((e) => e as String)
        .toList(),
    endDateArray:
        (json['end_date'] as List<dynamic>?)?.map((e) => e as String).toList(),
    endTimeArray:
        (json['end_time'] as List<dynamic>?)?.map((e) => e as String).toList(),
    concurrencyArray: (json['concurrency'] as List<dynamic>?)
        ?.map((e) => e as String)
        .toList(),
    priceArray:
        (json['price'] as List<dynamic>?)?.map((e) => e as String).toList(),
    slotLengthArray: (json['slot_length'] as List<dynamic>?)
        ?.map((e) => e as String)
        .toList(),
    activityArray: (json['activities'] as List<dynamic>?)
        ?.map((e) => e as String)
        .toList(),
    amountPaidArray: (json['amount_paid'] as List<dynamic>?)
        ?.map((e) => e as String)
        .toList(),
    paymentOptionsArray: (json['payment_options'] as List<dynamic>?)
        ?.map((e) => e as String)
        .toList(),
    latlngArray:
        (json['latlng'] as List<dynamic>?)?.map((e) => e as String).toList(),
    descriptionArray: (json['description'] as List<dynamic>?)
        ?.map((e) => e as String)
        .toList(),
    locationNameArray: (json['location_name'] as List<dynamic>?)
        ?.map((e) => e as String)
        .toList(),
    synopsisArray:
        (json['synopsis'] as List<dynamic>?)?.map((e) => e as String).toList(),
    photoArray:
        (json['photo'] as List<dynamic>?)?.map((e) => e as String).toList(),
    tncArray: (json['tnc'] as List<dynamic>?)?.map((e) => e as String).toList(),
    minPlayersArray:
        (json['split_payment_configs.players.min'] as List<dynamic>?)
            ?.map((e) => e as String)
            .toList(),
    maxPlayersArray:
        (json['split_payment_configs.players.max'] as List<dynamic>?)
            ?.map((e) => e as String)
            .toList(),
    defaultPlayersArray:
        (json['split_payment_configs.players.default'] as List<dynamic>?)
            ?.map((e) => e as String)
            .toList(),
    amountArray:
        (json['amount'] as List<dynamic>?)?.map((e) => e as String).toList(),
    playersArray:
        (json['players'] as List<dynamic>?)?.map((e) => e as String).toList(),
    discountArray:
        (json['discount'] as List<dynamic>?)?.map((e) => e as String).toList(),
    creditsArray:
        (json['credits'] as List<dynamic>?)?.map((e) => e as String).toList(),
    validityArray:
        (json['validity'] as List<dynamic>?)?.map((e) => e as String).toList(),
    gstNoArray:
        (json['gst_no'] as List<dynamic>?)?.map((e) => e as String).toList(),
    closestMetroArray: (json['closest_metro'] as List<dynamic>?)
        ?.map((e) => e as String)
        .toList(),
    businessProfileNameArray: (json['business_profile.name'] as List<dynamic>?)
        ?.map((e) => e as String)
        .toList(),
    businessProfileAddressArray:
        (json['business_profile.address'] as List<dynamic>?)
            ?.map((e) => e as String)
            .toList(),
    businessProfileGstNoArray:
        (json['business_profile.gst_no'] as List<dynamic>?)
            ?.map((e) => e as String)
            .toList(),
    sportsIdsArray:
        (json['sport_ids'] as List<dynamic>?)?.map((e) => e as String).toList(),
    skillLevelArray: (json['skill_level'] as List<dynamic>?)
        ?.map((e) => e as String)
        .toList(),
    typeArray:
        (json['type'] as List<dynamic>?)?.map((e) => e as String).toList(),
    usersArray:
        (json['users'] as List<dynamic>?)?.map((e) => e as String).toList(),
    venueId:
        (json['venue_id'] as List<dynamic>?)?.map((e) => e as String).toList(),
    isPaid:
        (json['is_paid'] as List<dynamic>?)?.map((e) => e as String).toList(),
    noOfParticipants: (json['no_of_participants'] as List<dynamic>?)
        ?.map((e) => e as String)
        .toList(),
    perPlayerShare: (json['per_player_share'] as List<dynamic>?)
        ?.map((e) => e as String)
        .toList(),
    sportsId:
        (json['sport_id'] as List<dynamic>?)?.map((e) => e as String).toList(),
    uuid: (json['id'] as List<dynamic>?)?.map((e) => e as String).toList(),
  );
}

Map<String, dynamic> _$ValidationErrorToJson(ValidationError instance) =>
    <String, dynamic>{
      'fcm_id': instance.fcmIdArray,
      'name': instance.nameArray,
      'user_details.name': instance.nameDetailArray,
      'email': instance.emailArray,
      'phone_number': instance.mobileArray,
      'user_details.phone_number': instance.mobileDetailArray,
      'password': instance.passwordArray,
      'slots': instance.slotsArray,
      'date_of_birth': instance.dateOfBirthArray,
      'user_details.date_of_birth': instance.dateOfBirthDetailArray,
      'current_password': instance.currentPasswordArray,
      'company_name': instance.companyNameArray,
      'note': instance.noteArray,
      'address': instance.addressArray,
      'available_time_period': instance.availableTimePeriodArray,
      'sports': instance.sportsArray,
      'sport_ids': instance.sportsIdsArray,
      'photos': instance.photosArray,
      'city_id': instance.cityIdArray,
      'tax': instance.taxArray,
      'start_date': instance.startDateArray,
      'start_time': instance.startTimeArray,
      'end_date': instance.endDateArray,
      'end_time': instance.endTimeArray,
      'concurrency': instance.concurrencyArray,
      'price': instance.priceArray,
      'slot_length': instance.slotLengthArray,
      'activities': instance.activityArray,
      'amount_paid': instance.amountPaidArray,
      'payment_options': instance.paymentOptionsArray,
      'latlng': instance.latlngArray,
      'description': instance.descriptionArray,
      'location_name': instance.locationNameArray,
      'synopsis': instance.synopsisArray,
      'photo': instance.photoArray,
      'tnc': instance.tncArray,
      'split_payment_configs.players.min': instance.minPlayersArray,
      'split_payment_configs.players.max': instance.maxPlayersArray,
      'split_payment_configs.players.default': instance.defaultPlayersArray,
      'amount': instance.amountArray,
      'players': instance.playersArray,
      'discount': instance.discountArray,
      'credits': instance.creditsArray,
      'validity': instance.validityArray,
      'gst_no': instance.gstNoArray,
      'business_profile.name': instance.businessProfileNameArray,
      'business_profile.address': instance.businessProfileAddressArray,
      'business_profile.gst_no': instance.businessProfileGstNoArray,
      'closest_metro': instance.closestMetroArray,
      'skill_level': instance.skillLevelArray,
      'users': instance.usersArray,
      'type': instance.typeArray,
      'id': instance.uuid,
      'per_player_share': instance.perPlayerShare,
      'no_of_participants': instance.noOfParticipants,
      'venue_id': instance.venueId,
      'sport_id': instance.sportsId,
      'is_paid': instance.isPaid,
    };
