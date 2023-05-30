import 'dart:async';
import 'package:evs/Module%20for%20Get%20Data/Inquires_response.dart';
import 'package:evs/Module%20for%20Get%20Data/Login_response.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../Module For Post Data/Post_inquires_model..dart';
import '../Widgets/Gridview.dart';

class DBHelper {
  static const String TABLE_LOGINRESPONSE = 'LoginResponse';
  static const String TABLE_USER = 'UserInfo';
  static const String DBname = 'EVS.db';
  static const String TABLE_INQUIRY = 'Inquiry';
  static const String TABLE_INQUIRYPHOTOS = 'InquiryPhotos';
  static const String TABLE_RESIDENCEVERIFICATION = 'ResidenceVerifications';
  static const String TABLE_RESIDENCE_PROFILE = 'ResidenceProfile';
  static const String TABLE_RESIDENCE_DETAILS = 'ResidenceDetails';
  static const String TABLE_RESIDENCE_NEIGHBOUR = 'ResidenceNeighborCheck';
  static const String TABLE_OFFICEVERIFICATION = 'OfficeVerifications';
  static const String TABLE_OFFICE_ADDRESSDETAILS = 'OfficeAddressDetails';
  static const String TABLE_OFFICE_BussWrkDETAILS = 'OfficeBusinessWorkDetails';
  static const String TABLE_OFFICE_NghbrCHECK = 'OfficeNeighborMarketCheck';
  static const String TABLE_OFFICE_HR_DETAILS = 'OfficeHRDetails';
  static const String TABLE_BANKSTATEMENT_VERIFICATION =
      'BankStatementVerifications';
  static const String TABLE_SALARYSLIP_VERIFICATION = 'SalarySlipVerifications';
  static const String TABLE_TENANT_VERIFICATION = 'TenantVerifications';
  static Future<Database> initDB() async {
    var dbpath = await getDatabasesPath();
    String path = join(dbpath + DBname);
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  static Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
    CREATE TABLE IF NOT EXISTS $TABLE_LOGINRESPONSE(
      message TEXT
    )
  ''');
    await db.execute('''
      CREATE TABLE IF NOT EXISTS $TABLE_USER(
      Id TEXT,
      UserName TEXT,
      PasswordHash TEXT,
      BranchId INTEGER,
      FirstName TEXT,
      LastName TEXT,
      code TEXT   
      )''');

    // InQuiry Table
    await db.execute('''
        CREATE TABLE IF NOT EXISTS $TABLE_INQUIRY(
          ID INTEGER PRIMARY KEY AUTOINCREMENT,
            InquiryId INTEGER,
            CompanyId INTEGER,
            ICILBranchId INTEGER,
            CustomerBranchId INTEGER,
            ProductId INTEGER,
        		CompanyName TEXT,
            ICILBranchName TEXT,
            CustomerBranchName TEXT,
        		ProductName TEXT,
            AppNo TEXT,
            AppName TEXT,
        		AppContact TEXT,
            AppCNIC TEXT,
        		UserID TEXT,
            Status TEXT,           
            orignalIndex INTEGER
            )
            ''');
    // Inquiry Photos Table
    await db.execute('''
      CREATE TABLE IF NOT EXISTS $TABLE_INQUIRYPHOTOS(
        ID INTEGER PRIMARY KEY AUTOINCREMENT,
        		InquiryId TEXT,
            UserID TEXT,
            VerificationType TEXT,
        		PersonType TEXT,
            appPhoto TEXT,
        		FOREIGN KEY(InquiryId) REFERENCES $TABLE_INQUIRY(ID)
            )
          ''');
    //RESIDENCE VERIFICATION table
    await db.execute('''
        CREATE TABLE IF NOT EXISTS $TABLE_RESIDENCEVERIFICATION(
            ResidenceVerificationId INTEGER PRIMARY KEY,
        		InquiryId INTEGER,
            UserID TEXT,
            PersonType TEXT,
        		PersonName TEXT,
            PersonContactNo TEXT,
        		PersonCNIC TEXT,
            ResidenceAddress TEXT,
        		NearestLandmark TEXT,
            GeneralComments TEXT,
        		OutComeVerification TEXT,
            GpsLocation TEXT,
            GpsURL TEXT,
        		Status TEXT,
            StatusDate TEXT,
            isSync TEXT,
            OrderTop TEXT,
        		FOREIGN KEY(InquiryId) REFERENCES $TABLE_INQUIRY(ID)
            )
            ''');
    //TABLE_RESIDENCE_PROFILE
    await db.execute('''
            CREATE TABLE IF NOT EXISTS $TABLE_RESIDENCE_PROFILE(
            ResidenceVerificationId INTEGER PRIMARY KEY AUTOINCREMENT,
        		InquiryId INTEGER,
            PersonType TEXT,
        		TypeOfResidence TEXT,
            ApplicantIsA TEXT,
        		MentionOther TEXT,
            MentionRent TEXT, 
        		SizeAreaApprox TEXT,
            UtilizationOfResidence TEXT,
        		RentDeedVerified TEXT,
            Neighborhood TEXT,
            AreaAccessibility TEXT,
        		ResidentsBelongsTo TEXT,
            RepossessionInTheArea TEXT,
        		Status TEXT,
        		FOREIGN KEY(InquiryId) REFERENCES $TABLE_RESIDENCEVERIFICATION(ResidenceVerificationId)
            )
            ''');
    // TABLE_RESIDENCE_DETAILS
    await db.execute('''
            CREATE TABLE IF NOT EXISTS $TABLE_RESIDENCE_DETAILS(
            ResidenceDetailId INTEGER PRIMARY KEY,
        		InquiryId INTEGER,
            PersonType TEXT,
            IsApplicantAvailable TEXT,
        		NameOfPersonToMet TEXT,
            RelationWithApplicant TEXT,
        		WasActualAddressSame TEXT,
            CorrectAddress TEXT,
            PhoneNo TEXT,
        		LivesAtGivenAddress TEXT,
            PermanentAddress TEXT,
        		SinceHowLongLiving TEXT,
            SinceHowintLiving TEXT,
            CNICNo TEXT,
        		Status TEXT,
        		FOREIGN KEY(InquiryId) REFERENCES $TABLE_RESIDENCEVERIFICATION(ResidenceVerificationId)
            )
            ''');
    await db.execute('''
           CREATE TABLE IF NOT EXISTS $TABLE_RESIDENCE_NEIGHBOUR(
            ResidenceVerificationId INTEGER PRIMARY KEY AUTOINCREMENT,
        		InquiryId INTEGER,
            PersonType TEXT,
            NeighborName TEXT,
        		NeighborAddress TEXT,
            KnowsApplicant TEXT,
        		KnowsHowLong TEXT,
            NeighborComments TEXT,
        		Status TEXT,
        		FOREIGN KEY(InquiryId) REFERENCES $TABLE_RESIDENCEVERIFICATION(ResidenceVerificationId))
            ''');
    //TABLE_OFFICEVERIFICATION
    await db.execute('''
             CREATE TABLE IF NOT EXISTS $TABLE_OFFICEVERIFICATION(
            OID INTEGER PRIMARY KEY AUTOINCREMENT,
        		InquiryId INTEGER,
            UserID TEXT,
            PersonType TEXT,
        		PersonName TEXT,
            PersonContactNo TEXT,
        		PersonDesignation TEXT,
            OfficeName TEXT,
            OfficeAddress TEXT,
        		NearestLandmark TEXT,
            GeneralComments TEXT,
        		OutComeVerification TEXT,
            GpsLocation TEXT,
            GpsURL TEXT,
        		Status TEXT,
            StatusDate TEXT,
            isSync TEXT,
            OrderTop INTEGER,
        		FOREIGN KEY(InquiryId) REFERENCES $TABLE_INQUIRY(ID))
            ''');
    // TABLE_OFFICE_ADDRESSDETAILS
    await db.execute('''
          CREATE TABLE IF NOT EXISTS $TABLE_OFFICE_ADDRESSDETAILS(
            OID INTEGER PRIMARY KEY AUTOINCREMENT,
        		InquiryId INTEGER,
            PersonType TEXT,
        		WasActualAddressSame TEXT,
            CorrectAddress TEXT,
        		EstablishedTime TEXT,
            WorksAtGivenAddress TEXT,
        		GiveNewAddress TEXT,
            IsApplicantAvailable TEXT,
        		GiveReason TEXT,
            MetPersonCNIC TEXT,
            CNICOS TEXT,
        		CNICNo TEXT,
            Status TEXT,
        		FOREIGN KEY(InquiryId) REFERENCES OfficeVerifications(OID))
            ''');
    //TABLE_OFFICE_BussWrkDETAILS
    await db.execute('''
            CREATE TABLE IF NOT EXISTS $TABLE_OFFICE_BussWrkDETAILS(
            OID INTEGER PRIMARY KEY AUTOINCREMENT,
        		InquiryId INTEGER,
            PersonType TEXT,
        		TypeOfBusiness TEXT,
            OthefBusiness TEXT,
        		NatureOfBusiness TEXT,
            OtherNatureOfBusiness TEXT,
        		ApplicantIsA TEXT,
            MentionOther TEXT,
            MentionRent TEXT,
        		BusinessLegalEntity TEXT,
            GovtEmpBusinessLegalEntity TEXT,
        		NamePlateAffixed TEXT,
            SizeApproxArea TEXT,
            BusinessActivity TEXT,
        		NoOfEmployees TEXT,
            BusinessEstablishedSince TEXT,
        		BankStatementVerified TEXT,
            Status TEXT,
        		FOREIGN KEY(InquiryId) REFERENCES $TABLE_OFFICEVERIFICATION(OID))
            ''');
    // TABLE_OFFICE_NghbrCHECK
    await db.execute('''
           CREATE TABLE IF NOT EXISTS $TABLE_OFFICE_NghbrCHECK(
            OID INTEGER PRIMARY KEY AUTOINCREMENT,
        		InquiryId INTEGER,
            PersonType TEXT,
            NeighborName TEXT,
        		NeighborAddress TEXT,
            KnowsApplicant TEXT, 
        		KnowsHowLong TEXT,
            NeighborComments TEXT,
        		BusinessEstablishedSinceMarketCheck TEXT,
            Status TEXT,
        		FOREIGN KEY(InquiryId) REFERENCES $TABLE_OFFICEVERIFICATION(OID))
            ''');
    // TABLE_OFFICE_HR_DETAILS
    await db.execute('''
          CREATE TABLE IF NOT EXISTS $TABLE_OFFICE_HR_DETAILS(
          OID INTEGER PRIMARY KEY AUTOINCREMENT,
					InquiryId INTEGER,
          PersonType TEXT,
          NameOfPersonToMet TEXT,
					OHrKnowsApplicant TEXT,
          ApplicantEmploymentStatus TEXT,
					ApplicantEmploymentPeriod TEXT, 
          ApplicantDesignation TEXT,
					OHrNatureOfBusiness TEXT,
          OtherOHrNatureOfBusiness TEXT,
					GrossSalary TEXT,
          NetTakeHomeSalary TEXT,
          SalarySlipVerified TEXT,
					BankStatementVerified TEXT,
          Status TEXT,
					FOREIGN KEY(InquiryId) REFERENCES $TABLE_OFFICEVERIFICATION(OID))
          ''');
    // BANKSTATEMENT VERIFICATION
    await db.execute('''
          CREATE TABLE IF NOT EXISTS $TABLE_BANKSTATEMENT_VERIFICATION(
            NearestLandMark TEXT,
            ID INTEGER PRIMARY KEY AUTOINCREMENT,
        		InquiryId INTEGER,
            UserID TEXT,
            PersonType TEXT,
        		PersonName TEXT,
            PersonContactNo TEXT,
            BankName TEXT,
        		BankAddress TEXT,
        		GeneralComments TEXT,
            OutComeVerification TEXT,
        		GpsLocation TEXT,
            GpsURL TEXT,
        		Status TEXT,
            StatusDate TEXT,
            isSync TEXT,
            OrderTop INTEGER,
        		FOREIGN KEY(InquiryId) REFERENCES $TABLE_INQUIRY(ID))
            ''');
    // SALARYSLIP VERIFICATION
    await db.execute('''
            CREATE TABLE IF NOT EXISTS $TABLE_SALARYSLIP_VERIFICATION(
            dataID TEXT,
            ID INTEGER PRIMARY KEY,
        		InquiryId INTEGER,
            UserID TEXT,
            PersonType TEXT,
        		PersonName TEXT,
            PersonContactNo TEXT,
        		OfficeName TEXT,
            OfficeAddress TEXT,
            NearestLandmark TEXT,
        		GeneralComments TEXT,
            OutComeVerification TEXT,
        		GpsLocation TEXT,
            GpsURL TEXT,
        		Status TEXT,
            StatusDate TEXT,
            isSync TEXT,
            OrderTop INTEGER,
        		FOREIGN KEY(InquiryId) REFERENCES $TABLE_INQUIRY(ID))
            ''');
    // TENANT VERIFICATION
    await db.execute('''
            CREATE TABLE IF NOT EXISTS $TABLE_TENANT_VERIFICATION(
            ID INTEGER PRIMARY KEY,
        		InquiryId INTEGER,
            UserID TEXT,
            PersonType TEXT,
        		PersonName TEXT,
            PersonContactNo TEXT,
        		TenantAddress TEXT,
            NearestLandmark TEXT,
        		TenantName TEXT,
            TenantContactNo TEXT,
        		TenantCNIC TEXT,
            TenancyPeriod TEXT,
        		TenantRent INTEGER,
        		GeneralComments TEXT,
            OutComeVerification TEXT,
        		GpsLocation TEXT,
            GpsURL TEXT,
        		Status TEXT,
            StatusDate TEXT,
            isSync TEXT,
            OrderTop INTEGER,
        		FOREIGN KEY(InquiryId) REFERENCES $TABLE_INQUIRY(ID))
            ''');
  }

  static Future createUserinfoDB(LoginResponse res) async {
    Database db = await DBHelper.initDB();

    Map<String, dynamic> loginResponseData = {
      'message': loginresponse.message,
    };
    Map<String, dynamic> userResponse = {
      'UserName': loginresponse.user!.userName,
      'FirstName': loginresponse.user!.firstName,
      'LastName': loginresponse.user!.lastName,
      'PasswordHash': loginresponse.user!.passwordHash,
      'code': loginresponse.user!.code,
      'BranchId': loginresponse.user!.branchId,
      'Id': loginresponse.user!.id,
    };
    var newData, userNewData;
    newData = await db.insert(TABLE_LOGINRESPONSE, loginResponseData);
    userNewData = await db.insert(TABLE_USER, userResponse);
    return userNewData;
  }

  //Method for Reading the response of Database which comes from User class
  static Future<List<User>> Readresponse() async {
    Database db = await DBHelper.initDB();
    var userresponse = await db.query(TABLE_USER, orderBy: 'userName');
    List<User> userList = [];
    userList = userresponse.map((details) => User.fromJson(details)).toList();
    for (int i = 0; i < userList.length;) {
      id = userList[0].id.toString();
      break;
    }
    print(userList);

    return Future.value(userList);
  }

// Method of creating Database of Data lists
  static Future CreateInquiriesResponseDB(List<Data> dataa) async {
    Database db = await DBHelper.initDB();

    for (Data newdata in dataa) {
      Map<String, dynamic> DataEntry = {
        'InquiryId': newdata.InquiryId,
        'UserID': id,
        'CompanyId': newdata.CompanyId,
        'CompanyName': newdata.CompanyName,
        'ICILBranchId': newdata.ICILBranchId,
        'ICILBranchName': newdata.ICILBranchName,
        'CustomerBranchId': newdata.CustomerBranchId,
        'CustomerBranchName': newdata.CustomerBranchName,
        'ProductId': newdata.ProductId,
        'ProductName': newdata.ProductName,
        'AppNo': newdata.AppNo,
        'AppName': newdata.AppName,
        'AppContact': newdata.AppContact,
        'AppCNIC': newdata.AppCNIC,
        'orignalIndex': newdata.orignalIndex,
        'Status': newdata.Status
      };
      await db.insert(TABLE_INQUIRY, DataEntry);
    }
    for (int i = 0; i < dataa.length; i++) {
      for (final tenant in dataa[i].tenantVerifications!) {
        await db.insert(TABLE_TENANT_VERIFICATION, {
          'InquiryId': tenant.InquiryId,
          'NearestLandMark': tenant.NearestLandMark,
          'UserID': id,
          'PersonType': tenant.PersonType,
          'PersonName': tenant.PersonName,
          'PersonContactNo': tenant.PersonContactNo,
          'TenantAddress': tenant.TenantAddress,
          'TenantName': tenant.TenantName,
          'TenantContactNo': tenant.TenantContactNo,
          'TenantCNIC': tenant.TenantCNIC,
          'TenancyPeriod': tenant.TenancyPeriod,
          'TenantRent': tenant.TenantRent,
          'GeneralComments': tenant.GeneralComments,
          'OutComeVerification': tenant.OutComeVerification,
          'GpsLocation': tenant.GpsLocation,
          'GpsURL': tenant.GpsURL,
          'Status': tenant.Status,
          'StatusDate': tenant.StatusDate,
          'isSync': "None",
          'OrderTop': 0,
        });
      }

      for (final work in dataa[i].workOfficeVerifications!) {
        await db.insert(TABLE_OFFICEVERIFICATION, {
          'OID': work.WorkOfficeVerificationId,
          'NearestLandMark': work.NearestLandMark,
          'InquiryId': work.InquiryId,
          'UserID': id,
          'PersonType': work.PersonType,
          'PersonName': work.PersonName,
          'PersonContactNo': work.PersonContactNo,
          'PersonDesignation': work.PersonDesignation,
          'OfficeName': work.OfficeName,
          'OfficeAddress': work.OfficeAddress,
          'GeneralComments': work.GeneralComments,
          'OutComeVerification': work.OutComeVerification,
          'GpsLocation': work.GpsLocation,
          'GpsURL': work.GpsURL,
          'Status': work.Status,
          'StatusDate': work.StatusDate,
          'isSync': "None",
          'OrderTop': 0
        });
      }

      for (final residence in dataa[i].residenceVerifications!) {
        await db.insert(TABLE_RESIDENCEVERIFICATION, {
          'ResidenceVerificationId': residence.ResidenceVerificationId,
          'InquiryId': residence.InquiryId,
          'NearestLandMark': residence.NearestLandMark,
          'UserID': id,
          'PersonType': residence.PersonType,
          'PersonName': residence.PersonName,
          'PersonContactNo': residence.PersonContactNo,
          'PersonCNIC': residence.PersonCNIC,
          'ResidenceAddress': residence.ResidenceAddress,
          'GeneralComments': residence.GeneralComments,
          'OutComeVerification': residence.OutComeVerification,
          'GpsLocation': residence.GpsLocation,
          'GpsURL': residence.GpsURL,
          'Status': residence.Status,
          'StatusDate': residence.StatusDate,
          'isSync': "none",
          'OrderTop': 0,
        });
      }

      for (final salary in dataa[i].salarySlipVerifications!) {
        await db.insert(TABLE_SALARYSLIP_VERIFICATION, {
          'InquiryId': salary.InquiryId,
          'UserID': id,
          'NearestLandMark': salary.NearestLandMark,
          'PersonType': salary.PersonType,
          'PersonName': salary.PersonName,
          'PersonContactNo': salary.PersonContactNo,
          'OfficeName': salary.OfficeName,
          'OfficeAddress': salary.OfficeAddress,
          'GeneralComments': salary.GeneralComments,
          'OutComeVerification': salary.OutComeVerification,
          'GpsLocation': salary.GpsLocation,
          'GpsURL': salary.GpsURL,
          'Status': salary.Status,
          'StatusDate': salary.StatusDate,
          'isSync': "None",
          'OrderTop': 0,
        });
      }

      for (final bank in dataa[i].bankStatementVerifications!) {
        await db.insert(TABLE_BANKSTATEMENT_VERIFICATION, {
          'InquiryId': bank.InquiryId,
          'UserID': id,
          'NearestLandMark': bank.NearestLandMark,
          'PersonType': bank.PersonType,
          'PersonName': bank.PersonName,
          'PersonContactNo': bank.PersonContactNo,
          'BankName': bank.BankName,
          'BankAddress': bank.BankAddress,
          'GeneralComments': bank.GeneralComments,
          'OutComeVerification': bank.OutComeVerification,
          'GpsLocation': bank.GpsLocation,
          'GpsURL': bank.GpsURL,
          'Status': bank.Status,
          'StatusDate': bank.StatusDate,
          'isSync': "None",
          'OrderTop': 0,
        });
      }
    }
  }

  //Method of reading Response from InquiryDB
  static Future<List<Data>> DataResponse() async {
    List<Data> DataList = [];
    try {
      Database db = await DBHelper.initDB();
      List<Map<String, dynamic>> dataRows = await db.query(TABLE_INQUIRY);
      for (var datarow in dataRows) {
        final dataID = datarow['InquiryId'];
        List<Map<String, dynamic>> tenantRows = await db.query(
            TABLE_TENANT_VERIFICATION,
            orderBy: 'PersonName',
            where: 'InquiryId=?',
            whereArgs: [dataID]);
        List<Map<String, dynamic>> officeRows = await db.query(
            TABLE_OFFICEVERIFICATION,
            orderBy: 'PersonName',
            where: 'InquiryId=?',
            whereArgs: [dataID]);
        List<Map<String, dynamic>> ResidenceRows = await db.query(
            TABLE_RESIDENCEVERIFICATION,
            orderBy: 'PersonName',
            where: 'InquiryId=?',
            whereArgs: [dataID]);
        List<Map<String, dynamic>> BankRows = await db.query(
            TABLE_BANKSTATEMENT_VERIFICATION,
            orderBy: 'PersonName',
            where: 'InquiryId=?',
            whereArgs: [dataID]);
        List<Map<String, dynamic>> Sliprows = await db.query(
            TABLE_SALARYSLIP_VERIFICATION,
            orderBy: 'PersonName',
            where: 'InquiryId=?',
            whereArgs: [dataID]);
        List<TenantVerifications> tenants = tenantRows
            .map((tenent) => TenantVerifications.fromJson(tenent))
            .toList();
        List<WorkOfficeVerifications> office = officeRows
            .map((officedata) => WorkOfficeVerifications.fromJson(officedata))
            .toList();
        List<ResidenceVerifications> Residence = ResidenceRows.map(
            (residenceData) =>
                ResidenceVerifications.fromJson(residenceData)).toList();
        List<BankStatementVerifications> Bank = BankRows.map(
                (bankData) => BankStatementVerifications.fromJson(bankData))
            .toList();
        List<SalarySlipVerifications> Slip = Sliprows.map(
            (SlipData) => SalarySlipVerifications.fromJson(SlipData)).toList();
        DataList.add(Data(
            CompanyName: datarow['CompanyName'],
            ProductName: datarow['ProductName'],
            AppContact: datarow['AppContact'],
            InquiryId: datarow['InquiryId'],
            CompanyId: datarow['CompanyId'],
            ICILBranchId: datarow['ICILBranchId'],
            CustomerBranchId: datarow['CustomerBranchId'],
            ProductId: datarow['ProductId'],
            ICILBranchName: datarow['ICILBranchName'],
            CustomerBranchName: datarow['CustomerBranchName'],
            AppNo: datarow['AppNo'],
            AppName: datarow['AppName'],
            AppCNIC: datarow['AppCNIC'],
            Status: datarow['Status'],
            orignalIndex: datarow['orignalIndex'],
            tenantVerifications: tenants,
            salarySlipVerifications: Slip,
            workOfficeVerifications: office,
            bankStatementVerifications: Bank,
            residenceVerifications: Residence));
      }
    } catch (e) {
      throw e;
    }

    return Future.value(DataList);
  }

  static Future<void> createResidenceFieldsData(
      ResidenceDetail resDetail) async {
    Database db = await DBHelper.initDB();
    if (resDetail != null) {
      db.insert(TABLE_RESIDENCE_DETAILS, {
        'ResidenceDetailId': resDetail.ResidenceDetailId,
        'IsApplicantAvailable': resDetail.IsApplicantAvailable,
        'NameOfPersonToMet': resDetail.NameOfPersonToMet,
        'RelationWithApplicant': resDetail.RelationWithApplicant,
        'WasActualAddressSame': resDetail.WasActualAddressSame,
        'CorrectAddress': resDetail.CorrectAddress,
        'PhoneNo': resDetail.PhoneNo,
        'LivesAtGivenAddress': resDetail.LivesAtGivenAddress,
        'PermanentAddress': resDetail.PermanentAddress,
        'SinceHowintLiving': resDetail.SinceHowintLiving,
        'CNICNo': resDetail.CNICNo,
        'InquiryId': resDetail.InquiryId,
        'PersonType': resDetail.PersonType
      });
    }
  }
}
 // static Future<int> updateContacts(LoginResponse updateResponse) async {
  //   Database db = await DBHelper.initDB();

  //   return await db.update('contacts', updateResponse.toJson(),
  //       where: 'id = ?', whereArgs: [updateResponse.user!.id]);
  // }