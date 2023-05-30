import 'package:evs/Module%20for%20Get%20Data/Inquires_response.dart';

ResidenceDetail residencedetail = new ResidenceDetail();

class ResidenceDetail {
  String? ResidenceDetailId;
  String? InquiryId;
  String? PersonType;
  String? Status;
  String? IsApplicantAvailable; //Did you meet the applicant
  String? NameOfPersonToMet; //if applicant not available.
  String?
      RelationWithApplicant; //RelatioinWithApplicant if applicant not available.
  String? WasActualAddressSame; //Was actual address same as above?
  String? CorrectAddress; //Give correct addres if address not same ..
  String? PhoneNo;
  String? LivesAtGivenAddress; //does applicant lives at the given address
  String?
      PermanentAddress; //Permanent address if not lives at the given address
  String?
      SinceHowintLiving; //Since how int applicant is living on the same address
  String? CNICNo; //applicant cnic no.

  ResidenceDetail(
      {this.ResidenceDetailId,
      this.IsApplicantAvailable,
      this.NameOfPersonToMet,
      this.RelationWithApplicant,
      this.WasActualAddressSame,
      this.CorrectAddress,
      this.PhoneNo,
      this.LivesAtGivenAddress,
      this.PermanentAddress,
      this.SinceHowintLiving,
      this.CNICNo,
      this.InquiryId,
      this.PersonType,
      this.Status});
  ResidenceDetail.fromJson(Map<String, dynamic> json)
      : ResidenceDetailId = json['ResidenceDetailId'],
        IsApplicantAvailable = json['IsApplicantAvailable'],
        NameOfPersonToMet = json['NameOfPersonToMet'],
        WasActualAddressSame = json['WasActualAddressSame'],
        CorrectAddress = json['CorrectAddress'],
        PhoneNo = json['PhoneNo'],
        LivesAtGivenAddress = json['LivesAtGivenAddress'],
        PermanentAddress = json['PermanentAddress'],
        CNICNo = json['CNICNo'],
        Status = json['Status'],
        InquiryId = json['InquiryId'],
        PersonType = json['PersonType'];
}

class ResidenceProfile {
  int? ResidenceDetailId;
  String? TypeOfResidence; //House - Portion - Apartment
  String? ApplicantIsA; //Owner - Tenant - Other
  String? MentionOther;
  double? MentionRent; // if Tenant mention rent
  String? SizeApproxArea;
  String? UtilizationOfResidence; // Residential - Commercial
  String? RentDeedVerified; //If application means if Tenant
  String? Neighborhood; // neighborhood fields
  String? AreaAccessibility;
  String? ResidentsBeintsTo;
  String? RepossessionInTheArea;

  ResidenceProfile(
    this.ResidenceDetailId,
    this.TypeOfResidence,
    this.ApplicantIsA,
    this.MentionOther,
    this.MentionRent,
    this.SizeApproxArea,
    this.UtilizationOfResidence,
    this.RentDeedVerified,
    this.Neighborhood,
    this.AreaAccessibility,
    this.ResidentsBeintsTo,
    this.RepossessionInTheArea,
  );
  ResidenceProfile.fromJson(Map<String, dynamic> json)
      : ResidenceDetailId = json['ResidenceDetailId'],
        TypeOfResidence = json['TypeOfResidence'],
        ApplicantIsA = json['ApplicantIsA'],
        MentionOther = json['MentionOther'],
        MentionRent = json['MentionRent'],
        SizeApproxArea = json['SizeApproxArea'],
        UtilizationOfResidence = json['UtilizationOfResidence'],
        RentDeedVerified = json['RentDeedVerified'],
        Neighborhood = json['Neighborhood'],
        AreaAccessibility = json['AreaAccessibility'],
        ResidentsBeintsTo = json['ResidentsBeintsTo'],
        RepossessionInTheArea = json['RepossessionInTheArea'];
}

class NeighbourCheck {
  int? NeighbourCheckId;
  String? NeighborsName;
  String? NeighborsAddress;
  bool? KnowsApplicant; //Does Neighbor know the applicant
  String? KnowsHowint; // if neighbor knows the applicant then how int.
  String? NeighborComments; // Comments Regarding the applicant
  String? NeighborsName2;
  String? NeighborsAddress2;
  bool? KnowsApplicant2; //Does Neighbor know the applicant
  String? KnowsHowint2; // if neighbor knows the applicant then how int
  String? NeighborComments2; // Comments Regarding the applicant

  NeighbourCheck(
    this.NeighbourCheckId,
    this.NeighborsName,
    this.NeighborsAddress,
    this.KnowsApplicant,
    this.KnowsHowint,
    this.NeighborComments,
    this.NeighborsName2,
    this.NeighborsAddress2,
    this.KnowsApplicant2,
    this.KnowsHowint2,
    this.NeighborComments2,
  );
  NeighbourCheck.fromJson(Map<String, dynamic> json)
      : NeighbourCheckId = json['NeighbourCheckId'],
        NeighborsName = json['NeighborsName'],
        NeighborsName2 = json['NeighborsName2'],
        NeighborsAddress = json['NeighborsAddress'],
        NeighborsAddress2 = json['NeighborsAddress2'],
        KnowsApplicant = json['KnowsApplicant'],
        KnowsApplicant2 = json['KnowsApplicant2'],
        KnowsHowint = json['KnowsHowint'],
        KnowsHowint2 = json['KnowsHowint2'],
        NeighborComments = json['NeighborComments'],
        NeighborComments2 = json['NeighborComments2'];
}

class OfficeAddressDetail {
  int? OfficeAddressDetailId;
  bool? WasActualAddressSame; //Was actual address same as above mention.?
  String? CorrectAddress; //Give correct addres if address not same ..
  String?
      EstablishedTime; //Length of time the business / office has been established
  bool? WorkAtGivenAddress; //does applicant work at the given address
  String? GiveNewAddress;
  bool? IsApplicantAvailable; //Did you meet the applicant
  String? MetPersonName;
  String?
      GiveReason; //if applicant not available give the reason y not u meet the applicant.
  String? CNICOS; // Applicant's NIC # (O/s Physically if possible)
  String? CNICNo;
  String? MetPersonCNIC;

  OfficeAddressDetail(
    this.OfficeAddressDetailId,
    this.WasActualAddressSame,
    this.CorrectAddress,
    this.EstablishedTime,
    this.WorkAtGivenAddress,
    this.GiveNewAddress,
    this.IsApplicantAvailable,
    this.MetPersonName,
    this.GiveReason,
    this.CNICOS,
    this.CNICNo,
    this.MetPersonCNIC,
  );
  OfficeAddressDetail.fromJson(Map<String, dynamic> json)
      : OfficeAddressDetailId = json['OfficeAddressDetailId'],
        WasActualAddressSame = json['WasActualAddressSame'],
        CorrectAddress = json['CorrectAddress'],
        EstablishedTime = json['EstablishedTime'],
        WorkAtGivenAddress = json['WorkAtGivenAddress'],
        GiveNewAddress = json['GiveNewAddress'],
        IsApplicantAvailable = json['IsApplicantAvailable'],
        MetPersonName = json['MetPersonName'],
        GiveReason = json['GiveReason'],
        CNICOS = json['CNICOS'],
        CNICNo = json['CNICNo'],
        MetPersonCNIC = json['MetPersonCNIC'];
}

class BusinessWorkOfficeDetail {
  int?
      BusinessWorkOfficeDetailId; //Business Work Office Verification For (SEB/SEP)
  String? TypeOfBusiness; // Shop - Office - Restaurant Factory - other
  String? OtherTypeOfBusiness;

  String? ApplicantIsA;
  String? MentionOther;
  String? MentionRent;

  String?
      NatureOfBusiness; // Manufacturing - Services - Trading - Govt Emp. - other
  String? OtherNatureOfBusiness;

  String?
      BusinessLegalEntity; // Proprietor - Partnership - Pvt. Ltd. - Public Lt. - Govt
  String? GovtEmpBusinessLegalEntity;

  bool?
      NamePlateAffixed; //Was Business Name plate affixed at business place same as in application.
  String? SizeApproxArea;

  String? BusinessActivity; // Low - Medium - High
  int? NoOfEmployees; //Number of employees work in

  String? BusinessEstablesSince;

  String? LineOfBusiness; //bool bankStatmentVerified;

  BusinessWorkOfficeDetail(
    this.BusinessWorkOfficeDetailId,
    this.TypeOfBusiness,
    this.OtherTypeOfBusiness,
    this.ApplicantIsA,
    this.MentionOther,
    this.MentionRent,
    this.NatureOfBusiness,
    this.OtherNatureOfBusiness,
    this.BusinessLegalEntity,
    this.GovtEmpBusinessLegalEntity,
    this.NamePlateAffixed,
    this.SizeApproxArea,
    this.BusinessActivity,
    this.NoOfEmployees,
    this.BusinessEstablesSince,
    this.LineOfBusiness,
  );
  BusinessWorkOfficeDetail.fromJson(Map<String, dynamic> json)
      : BusinessWorkOfficeDetailId = json['BusinessWorkOfficeDetailId'],
        TypeOfBusiness = json['TypeOfBusiness'],
        OtherTypeOfBusiness = json['OtherTypeOfBusiness'],
        ApplicantIsA = json['ApplicantIsA'],
        MentionOther = json['MentionOther'],
        MentionRent = json['MentionRent'],
        NatureOfBusiness = json['NatureOfBusiness'],
        OtherNatureOfBusiness = json['OtherNatureOfBusiness'],
        BusinessLegalEntity = json['BusinessLegalEntity'],
        GovtEmpBusinessLegalEntity = json['GovtEmpBusinessLegalEntity'],
        NamePlateAffixed = json['NamePlateAffixed'],
        SizeApproxArea = json['SizeApproxArea'],
        BusinessActivity = json['BusinessActivity'],
        NoOfEmployees = json['NoOfEmployees'],
        BusinessEstablesSince = json['BusinessEstablesSince'],
        LineOfBusiness = json['LineOfBusiness'];

  Map<String, dynamic> toMap() {
    return {
      'BusinessWorkOfficeDetailId': BusinessWorkOfficeDetailId,
      'TypeOfBusiness': TypeOfBusiness,
      'OtherTypeOfBusiness': OtherTypeOfBusiness,
      'ApplicantIsA': ApplicantIsA,
      'MentionOther': MentionOther,
      'MentionRent': MentionRent,
      'NatureOfBusiness': NatureOfBusiness,
      'OtherNatureOfBusiness': OtherNatureOfBusiness,
      'BusinessLegalEntity': BusinessLegalEntity,
      'GovtEmpBusinessLegalEntity': GovtEmpBusinessLegalEntity,
      'NamePlateAffixed': NamePlateAffixed,
      'SizeApproxArea': SizeApproxArea,
      'BusinessActivity': BusinessActivity,
      'NoOfEmployees': NoOfEmployees,
      'BusinessEstablesSince': BusinessEstablesSince,
      'LineOfBusiness': LineOfBusiness,
    };
  }
}

class MarketeCheck {
  String? MarketeCheckId; // Neighbor / Markete Check
  String? NeighborsName;
  String? NeighborsAddress;
  bool? KnowsApplicant; // Does Neighbor know the applicant
  String? KnowsHowint; // if neighbor knows the applicant then how int.
  String? NeighborComments; // Comments Regarding the applicant
  String? BusinessEstablishedSinceMarketeCheck;
  String? NeighborsTwoName;
  String? NeighborsTwoAddress;
  bool? NeighborsTwoKnowsApplicant; // Does Neighbor know the applicant
  String?
      NeighborsTwoKnowsHowint; // if neighbor knows the applicant then how int.
  String? NeighborsTwoNeighborComments; // Comments Regarding the applicant
  String? NeighborsTwoBusinessEstablishedSinceMarketeCheck;

  MarketeCheck(
    this.MarketeCheckId,
    this.NeighborsName,
    this.NeighborsAddress,
    this.KnowsApplicant,
    this.KnowsHowint,
    this.NeighborComments,
    this.BusinessEstablishedSinceMarketeCheck,
    this.NeighborsTwoName,
    this.NeighborsTwoAddress,
    this.NeighborsTwoKnowsApplicant,
    this.NeighborsTwoKnowsHowint,
    this.NeighborsTwoNeighborComments,
    this.NeighborsTwoBusinessEstablishedSinceMarketeCheck,
  );
  MarketeCheck.fromJson(Map<String, dynamic> json)
      : MarketeCheckId = json['MarketeCheckId'],
        NeighborsName = json['NeighborsName'],
        NeighborsAddress = json['NeighborsAddress'],
        KnowsApplicant = json['KnowsApplicant'],
        KnowsHowint = json['KnowsHowint'],
        NeighborComments = json['KnowsHowint'],
        BusinessEstablishedSinceMarketeCheck =
            json['BusinessEstablishedSinceMarketeCheck'],
        NeighborsTwoName = json['NeighborsTwoName'],
        NeighborsTwoAddress = json['NeighborsTwoAddress'],
        NeighborsTwoKnowsApplicant = json['NeighborsTwoKnowsApplicant'],
        NeighborsTwoKnowsHowint = json['NeighborsTwoKnowsHowint'],
        NeighborsTwoNeighborComments = json['NeighborsTwoNeighborComments'],
        NeighborsTwoBusinessEstablishedSinceMarketeCheck =
            json['NeighborsTwoBusinessEstablishedSinceMarketeCheck'];

  Map<String, dynamic> toMap() {
    return {
      'MarketeCheckId': MarketeCheckId,
      'NeighborsName': NeighborsName,
      'NeighborsAddress': NeighborsAddress,
      'KnowsApplicant': KnowsApplicant,
      'KnowsHowint': KnowsHowint,
      'NeighborComments': NeighborComments,
      'BusinessEstablishedSinceMarketeCheck':
          BusinessEstablishedSinceMarketeCheck,
      'NeighborsTwoName': NeighborsTwoName,
      'NeighborsTwoAddress': NeighborsTwoAddress,
      'NeighborsTwoKnowsApplicant': NeighborsTwoKnowsApplicant,
      'NeighborsTwoKnowsHowint': NeighborsTwoKnowsHowint,
      'NeighborsTwoNeighborComments': NeighborsTwoNeighborComments,
      'NeighborsTwoBusinessEstablishedSinceMarketeCheck':
          NeighborsTwoBusinessEstablishedSinceMarketeCheck,
    };
  }
}

class OfficeHRDetail {
  //Office /Hr Verifcation For (Salary Salaried Individual);
  String? OfficeHRDetailId;
  String? NameOfPersonToMeet;
  String? OHrKnowsApplicant;
  String? ApplicantEmployementStatus;
  String? ApplicantEmployementPeriod;
  String? ApplicantDesignation;
  String? OHrNatureOfBusiness;
  String? OHrOtherNatureOfBusiness; // this field was missing
  double? GrossSalary;
  double? NetTakeHomeSalary;
  String? SalarySlipVerified; // late bool oHrBankStatmentVerified;

  OfficeHRDetail(
    this.OfficeHRDetailId,
    this.NameOfPersonToMeet,
    this.OHrKnowsApplicant,
    this.ApplicantEmployementStatus,
    this.ApplicantEmployementPeriod,
    this.ApplicantDesignation,
    this.OHrNatureOfBusiness,
    this.OHrOtherNatureOfBusiness,
    this.GrossSalary,
    this.NetTakeHomeSalary,
    this.SalarySlipVerified,
  );

  OfficeHRDetail.fromJson(Map<String, dynamic> json)
      : OfficeHRDetailId = json['OfficeHRDetailId'],
        NameOfPersonToMeet = json['NameOfPersonToMeet'],
        OHrKnowsApplicant = json['OHrKnowsApplicant'],
        ApplicantEmployementStatus = json['ApplicantEmployementStatus'],
        ApplicantEmployementPeriod = json['ApplicantEmployementPeriod'],
        ApplicantDesignation = json['ApplicantDesignation'],
        OHrNatureOfBusiness = json['OHrNatureOfBusiness'],
        OHrOtherNatureOfBusiness = json['OHrOtherNatureOfBusiness'],
        GrossSalary = json['GrossSalary'],
        NetTakeHomeSalary = json['NetTakeHomeSalary'],
        SalarySlipVerified = json['SalarySlipVerified'];

  Map<String, dynamic> toMap() {
    return {
      'OfficeHRDetailId': OfficeHRDetailId,
      'NameOfPersonToMeet': NameOfPersonToMeet,
      'OHrKnowsApplicant': OHrKnowsApplicant,
      'ApplicantEmployementStatus': ApplicantEmployementStatus,
      'ApplicantEmployementPeriod': ApplicantEmployementPeriod,
      'ApplicantDesignation': ApplicantDesignation,
      'OHrNatureOfBusiness': OHrNatureOfBusiness,
      'OHrOtherNatureOfBusiness': OHrOtherNatureOfBusiness,
      'GrossSalary': GrossSalary,
      'NetTakeHomeSalary': NetTakeHomeSalary,
      'SalarySlipVerified': SalarySlipVerified,
    };
  }
}

class TenantVerification {
  String? TenantVerificationId;
  String? InquiryId;
  String? PersonType;
  String? PersonName;
  String? PersonContactNo;
  String? TenantAddress;
  String? NearestLandMark;
  String? TenantName;
  String? TenantContactNo;
  String? TenantCNIC;
  String? TenancyPeriod;
  double? TenantRent;
  String? Status;
  DateTime? StatusDate;
  String? GeneralComments;
  String? OutComeVerification;
  String? GpsLocation;

  TenantVerification(
    this.TenantVerificationId,
    this.InquiryId,
    this.PersonType,
    this.PersonName,
    this.PersonContactNo,
    this.TenantAddress,
    this.NearestLandMark,
    this.TenantName,
    this.TenantContactNo,
    this.TenantCNIC,
    this.TenancyPeriod,
    this.TenantRent,
    this.Status,
    this.StatusDate,
    this.GeneralComments,
    this.OutComeVerification,
    this.GpsLocation,
  );
  TenantVerification.fromJson(Map<String, dynamic> json)
      : TenantVerificationId = json['TenantVerificationId'],
        InquiryId = json['InquiryId'],
        PersonType = json['PersonType'],
        PersonName = json['PersonName'],
        PersonContactNo = json['PersonContactNo'],
        TenantAddress = json['TenantAddress'],
        NearestLandMark = json['NearestLandMark'],
        TenantName = json['TenantName'],
        TenantContactNo = json['TenantContactNo'],
        TenantCNIC = json['TenantCNIC'],
        TenancyPeriod = json['TenancyPeriod'],
        TenantRent = json['TenantRent'],
        Status = json['TenantRent'],
        StatusDate = json['StatusDate'],
        GeneralComments = json['GeneralComments'],
        OutComeVerification = json['OutComeVerification'],
        GpsLocation = json['GpsLocation'];
  Map<String, dynamic> toMap() {
    return {
      'TenantVerificationId': TenantVerificationId,
      'InquiryId': InquiryId,
      'PersonType': PersonType,
      'PersonName': PersonName,
      'PersonContactNo': PersonContactNo,
      'TenantAddress': TenantAddress,
      'NearestLandMark': NearestLandMark,
      'TenantName': TenantName,
      'TenantContactNo': TenantContactNo,
      'TenantCNIC': TenantCNIC,
      'TenancyPeriod': TenancyPeriod,
      'TenantRent': TenancyPeriod,
      'Status': Status,
      'StatusDate': StatusDate,
      'GeneralComments': GeneralComments,
      'OutComeVerification': OutComeVerification,
      'GpsLocation': GpsLocation,
    };
  }
}

class SalarySlipVerification {
  String? SalarySlipVerificationId;
  String? InquiryId;
  String? PersonType;
  String? PersonName;
  String? PersonContactNo;
  String? OfficeName;
  String? OfficeAddress;
  String? NearestLandMark;
  String? PaySlipPath;
  String? GeneralComments;
  String? OutComeVerification;
  String? GpsLocation;

  SalarySlipVerification(
    this.SalarySlipVerificationId,
    this.InquiryId,
    this.PersonType,
    this.PersonName,
    this.PersonContactNo,
    this.OfficeName,
    this.OfficeAddress,
    this.NearestLandMark,
    this.PaySlipPath,
    this.GeneralComments,
    this.OutComeVerification,
    this.GpsLocation,
  );
  SalarySlipVerification.fromJson(Map<String, dynamic> json)
      : SalarySlipVerificationId = json['SalarySlipVerificationId'],
        InquiryId = json['InquiryId'],
        PersonType = json['PersonType'],
        PersonName = json['PersonName'],
        PersonContactNo = json['PersonContactNo'],
        OfficeName = json['OfficeName'],
        OfficeAddress = json['OfficeAddress'],
        NearestLandMark = json['NearestLandMark'],
        PaySlipPath = json['PaySlipPath'],
        GeneralComments = json['GeneralComments'],
        OutComeVerification = json['OutComeVerification'],
        GpsLocation = json['GpsLocation'];
  Map<String, dynamic> toMap() {
    return {
      'SalarySlipVerificationId': SalarySlipVerificationId,
      'InquiryId': InquiryId,
      'PersonType': PersonType,
      'PersonName': PersonName,
      'PersonContactNo': PersonContactNo,
      'OfficeName': OfficeName,
      'OfficeAddress': OfficeAddress,
      'NearestLandMark': NearestLandMark,
      'PaySlipPath': PaySlipPath,
      'GeneralComments': GeneralComments,
      'OutComeVerification': OutComeVerification,
      'GpsLocation': GpsLocation,
    };
  }
}

class BankStatementVerification {
  String? BankStatementVerificationId;
  String? InquiryId;
  String? PersonType;
  String? PersonName;
  String? PersonContactNo;
  String? BankName;
  String? BankAddress;
  String? NearestLandMark;
  String? GeneralComments;
  String? OutComeVerification;
  String? GpsLocation;

  BankStatementVerification(
    this.BankStatementVerificationId,
    this.InquiryId,
    this.PersonType,
    this.PersonName,
    this.PersonContactNo,
    this.BankName,
    this.BankAddress,
    this.NearestLandMark,
    this.GeneralComments,
    this.OutComeVerification,
    this.GpsLocation,
  );
  BankStatementVerification.fromJson(Map<String, dynamic> json)
      : BankStatementVerificationId = json['BankStatementVerificationId'],
        InquiryId = json['InquiryId'],
        PersonType = json['PersonType'],
        PersonName = json['PersonName'],
        PersonContactNo = json['PersonContactNo'],
        BankName = json['BankName'],
        BankAddress = json['BankAddress'],
        NearestLandMark = json['NearestLandMark'],
        GeneralComments = json['GeneralComments'],
        GpsLocation = json['GpsLocation'];

  Map<String, dynamic> toMap() {
    return {
      'BankStatementVerificationId': BankStatementVerificationId,
      'InquiryId': InquiryId,
      'PersonType': PersonType,
      'PersonName': PersonName,
      'PersonContactNo': PersonContactNo,
      'BankName': BankName,
      'BankAddress': BankAddress,
      'NearestLandMark': NearestLandMark,
      'GeneralComments': GeneralComments,
      'OutComeVerification': OutComeVerification,
      'GpsLocation': GpsLocation,
    };
  }
}
