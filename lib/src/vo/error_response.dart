import 'package:json_annotation/json_annotation.dart';

part 'error_response.g.dart';

@Deprecated("Use hudle_network")
@JsonSerializable()
class ValidationError {

  @JsonKey(name:"fcm_id", )
  List<String>? fcmIdArray;
  @JsonKey(name:"name" )
  List<String>? nameArray;
  @JsonKey(name:"user_details.name" )
  List<String>? nameDetailArray;
  @JsonKey(name:"email",)
  List<String>? emailArray;
  @JsonKey(name:"phone_number")
  List<String>? mobileArray;
  @JsonKey(name:"user_details.phone_number")
  List<String>? mobileDetailArray;
  @JsonKey(name:"password")
  List<String>? passwordArray;
  @JsonKey(name:"slots")
  List<String>? slotsArray;
  @JsonKey(name:"date_of_birth")
  List<String>? dateOfBirthArray;
  @JsonKey(name:"user_details.date_of_birth")
  List<String>? dateOfBirthDetailArray;
  @JsonKey(name:"current_password")
  List<String>? currentPasswordArray;
  @JsonKey(name:"company_name")
  List<String>? companyNameArray;
  @JsonKey(name:"note")
  List<String>? noteArray;
  @JsonKey(name:"address")
  List<String>? addressArray;
  @JsonKey(name:"available_time_period")
  List<String>? availableTimePeriodArray;
  @JsonKey(name:"sports")
  List<String>? sportsArray;
  @JsonKey(name:"sport_ids")
  List<String>? sportsIdsArray;
  @JsonKey(name:"photos")
  List<String>? photosArray;
  @JsonKey(name:"city_id")
  List<String>? cityIdArray;
  @JsonKey(name:"tax")
  List<String>? taxArray;
  @JsonKey(name:"start_date")
  List<String>? startDateArray;
  @JsonKey(name:"start_time")
  List<String>? startTimeArray;
  @JsonKey(name:"end_date")
  List<String>? endDateArray;
  @JsonKey(name:"end_time")
  List<String>? endTimeArray;
  @JsonKey(name:"concurrency")
  List<String>? concurrencyArray;
  @JsonKey(name:"price")
  List<String>? priceArray;
  @JsonKey(name:"slot_length")
  List<String>? slotLengthArray;
  @JsonKey(name:"activities")
  List<String>? activityArray;
  @JsonKey(name:"amount_paid")
  List<String>? amountPaidArray;
  @JsonKey(name:"payment_options")
  List<String>? paymentOptionsArray;
  @JsonKey(name:"latlng")
  List<String>? latlngArray;
  @JsonKey(name:"description")
  List<String>? descriptionArray;
  @JsonKey(name:"location_name")
  List<String>? locationNameArray;
  @JsonKey(name:"synopsis")
  List<String>? synopsisArray;
  @JsonKey(name:"photo")
  List<String>? photoArray;
  @JsonKey(name:"tnc")
  List<String>? tncArray;
  @JsonKey(name:"split_payment_configs.players.min")
  List<String>? minPlayersArray;
  @JsonKey(name:"split_payment_configs.players.max")
  List<String>? maxPlayersArray;
  @JsonKey(name:"split_payment_configs.players.default")
  List<String>? defaultPlayersArray;
  @JsonKey(name:"amount")
  List<String>? amountArray;
  @JsonKey(name:"players",)
  List<String>? playersArray;
  @JsonKey(name:"discount")
  List<String>? discountArray;
  @JsonKey(name:"credits")
  List<String>? creditsArray;
  @JsonKey(name:"validity")
  List<String>? validityArray;
  @JsonKey(name:"gst_no")
  List<String>? gstNoArray;
  @JsonKey(name:"business_profile.name")
  List<String>? businessProfileNameArray;
  @JsonKey(name:"business_profile.address")
  List<String>? businessProfileAddressArray;
  @JsonKey(name:"business_profile.gst_no")
  List<String>? businessProfileGstNoArray;
  @JsonKey(name:"closest_metro")
  List<String>? closestMetroArray;
  @JsonKey(name:"skill_level")
  List<String>? skillLevelArray;@
  JsonKey(name:"users")
  List<String>? usersArray;
  @JsonKey(name:"type")
  List<String>? typeArray;
  @JsonKey(name:"id")
  List<String>? uuid;
  @JsonKey(name:"per_player_share")
  List<String>? perPlayerShare;
  @JsonKey(name:"no_of_participants")
  List<String>? noOfParticipants;
  @JsonKey(name:"venue_id")
  List<String>? venueId;
  @JsonKey(name:"sport_id")
  List<String>? sportsId;
  @JsonKey(name:"is_paid")
  List<String>? isPaid;


  ValidationError(
  {
    this.fcmIdArray,
    this.nameArray,
    this.nameDetailArray,
    this.emailArray,
    this.mobileArray,
    this.mobileDetailArray,
    this.passwordArray,
    this.slotsArray,
    this.dateOfBirthArray,
    this.dateOfBirthDetailArray,
    this.currentPasswordArray,
    this.companyNameArray,
    this.noteArray,
    this.addressArray,
    this.availableTimePeriodArray,
    this.sportsArray,
    this.photosArray,
    this.cityIdArray,
    this.taxArray,
    this.startDateArray,
    this.startTimeArray,
    this.endDateArray,
    this.endTimeArray,
    this.concurrencyArray,
    this.priceArray,
    this.slotLengthArray,
    this.activityArray,
    this.amountPaidArray,
    this.paymentOptionsArray,
    this.latlngArray,
    this.descriptionArray,
    this.locationNameArray,
    this.synopsisArray,
    this.photoArray,
    this.tncArray,
    this.minPlayersArray,
    this.maxPlayersArray,
    this.defaultPlayersArray,
    this.amountArray,
    this.playersArray,
    this.discountArray,
    this.creditsArray,
    this.validityArray,
    this.gstNoArray,
    this.closestMetroArray,
    this.businessProfileNameArray,
    this.businessProfileAddressArray,
    this.businessProfileGstNoArray,
    this.sportsIdsArray,
    this.skillLevelArray,
    this.typeArray,
    this.usersArray,
    this.venueId,
    this.isPaid,
    this.noOfParticipants,
    this.perPlayerShare,
    this.sportsId,
    this.uuid
});

  factory ValidationError.fromJson(Map<String, dynamic> json) => _$ValidationErrorFromJson(json);

  Map<String, dynamic> toJson() => _$ValidationErrorToJson(this);
}