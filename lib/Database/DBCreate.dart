// import 'package:sqflite/sqflite.dart';

// class DBCreate {
//   Database db;
//   String table;

//   DBCreate(this.db, this.table);

//   void openCreateDB() {
//     table = '''
//         CREATE TABLE IF NOT EXISTS appUsers(ID INTEGER PRIMARY KEY AUTOINCREMENT,"
// 				+ "serverID VARCHAR,userName VARCHAR,password VARCHAR,firstName VARCHAR,lastName VARCHAR,branchID VARCHAR);

// ''';
//     db.execute(table);
//     table = '''
//         CREATE TABLE IF NOT EXISTS AppVersion(ID INTEGER PRIMARY KEY AUTOINCREMENT,"
// 				+ " URL VARCHAR, version VARCHAR, recordDate VARCHAR);

// ''';
//     db.execute(table);
//     // INQUIRY MASTER TABLE

//     table = '''
//              CREATE TABLE IF NOT EXISTS Inquiry(ID INTEGER PRIMARY KEY," +
//         		"CompanyName VARCHAR,ICILBranchName VARCHAR,CustomerBranchName VARCHAR," +
//         		"ProductName VARCHAR,AppNo VARCHAR,AppName VARCHAR," +
//         		"AppContactNo VARCHAR,AppCNIC VARCHAR,AppAddress VARCHAR," +
//         		"UserID VARCHAR,Status VARCHAR,StatusDate VARCHAR," +
//         		"isSync VARCHAR, OrderTop INTEGER);

// ''';
//     db.execute(table);
//     // PHOTOS
//     table = '''
//             CREATE TABLE IF NOT EXISTS InquiryPhotos(ID INTEGER PRIMARY KEY AUTOINCREMENT," +
//         		"MastID INTEGER,UserID VARCHAR,VerificationType VARCHAR," +
//         		"PersonType VARCHAR,appPhoto VARCHAR," +
//         		"FOREIGN KEY(MastID) REFERENCES Inquiry(ID)
//             );

// ''';
//     db.execute(table);
//     // RESIDENCE VERIFICATION
//     table = '''
//            CREATE TABLE IF NOT EXISTS ResidenceVerifications(RID INTEGER PRIMARY KEY," +
//         		"MastID INTEGER,UserID VARCHAR,PersonType VARCHAR," +
//         		"PersonName VARCHAR,PersonContactNo VARCHAR," +
//         		"PersonCNIC VARCHAR, ResidenceAddress VARCHAR, " +
//         		"NearestLandmark VARCHAR,GeneralComments VARCHAR," +
//         		"OutComeVerification VARCHAR,GpsLocation VARCHAR,GpsURL VARCHAR," +
//         		"Status VARCHAR,StatusDate VARCHAR, isSync VARCHAR, OrderTop INTEGER," +
//         		"FOREIGN KEY(MastID) REFERENCES Inquiry(ID));

// ''';
//     db.execute(table);

//     //RESIDENCE PROFILE VERIFICATION

//     table = '''
//            CREATE TABLE IF NOT EXISTS ResidenceProfile(RID INTEGER PRIMARY KEY," +
//         		"MastID INTEGER,PersonType VARCHAR," +
//         		"TypeOfResidence VARCHAR,ApplicantIsA VARCHAR," +
//         		"MentionOther VARCHAR, MentionRent VARCHAR, " +
//         		"SizeAreaApprox VARCHAR,UtilizationOfResidence VARCHAR," +
//         		"RentDeedVerified VARCHAR,Neighborhood VARCHAR,AreaAccessibility VARCHAR," +
//         		"ResidentsBelongsTo VARCHAR,RepossessionInTheArea VARCHAR," +
//         		"Status VARCHAR," +
//         		"FOREIGN KEY(MastID) REFERENCES ResidenceVerifications(RID));

// ''';
//     db.execute(table);

//     //RESIDENCE DETAILS
//     table = '''
//            CREATE TABLE IF NOT EXISTS ResidenceDetails(RID INTEGER PRIMARY KEY," +
//         		"MastID INTEGER,PersonType VARCHAR,IsApplicantAvailable VARCHAR," +
//         		"NameOfPersonToMet VARCHAR,RelationWithApplicant VARCHAR, " +
//         		"WasActualAddressSame VARCHAR, CorrectAddress VARCHAR,PhoneNo VARCHAR," +
//         		"LivesAtGivenAddress VARCHAR,PermanentAddress VARCHAR," +
//         		"SinceHowLongLiving VARCHAR,CNICNo VARCHAR," +
//         		"Status VARCHAR," +
//         		"FOREIGN KEY(MastID) REFERENCES ResidenceVerifications(RID)
//             );

// ''';
//     // db.execute(table);
//     // //RESIDENCE NEIGHBOUR
//     // table = '''
//     //        CREATE TABLE IF NOT EXISTS ResidenceDetails(RID INTEGER PRIMARY KEY," +
//     //     		"MastID INTEGER,PersonType VARCHAR,IsApplicantAvailable VARCHAR," +
//     //     		"NameOfPersonToMet VARCHAR,RelationWithApplicant VARCHAR, " +
//     //     		"WasActualAddressSame VARCHAR, CorrectAddress VARCHAR,PhoneNo VARCHAR," +
//     //     		"LivesAtGivenAddress VARCHAR,PermanentAddress VARCHAR," +
//     //     		"SinceHowLongLiving VARCHAR,CNICNo VARCHAR," +
//     //     		"Status VARCHAR," +
//     //     		"FOREIGN KEY(MastID) REFERENCES ResidenceVerifications(RID));

// // ''';
// //     db.execute(table);

//     //OFFICE VERIFICATION
//     table = '''
//           CREATE TABLE IF NOT EXISTS OfficeVerifications(OID INTEGER PRIMARY KEY," +
//         		"MastID INTEGER,UserID VARCHAR,PersonType VARCHAR," +
//         		"PersonName VARCHAR,PersonContactNo VARCHAR," +
//         		"PersonDesignation VARCHAR,OfficeName VARCHAR,OfficeAddress VARCHAR," +
//         		"NearestLandmark VARCHAR,GeneralComments VARCHAR," +
//         		"OutComeVerification VARCHAR,GpsLocation VARCHAR,GpsURL VARCHAR," +
//         		"Status VARCHAR,StatusDate VARCHAR, isSync VARCHAR, OrderTop INTEGER," +
//         		"FOREIGN KEY(MastID) REFERENCES Inquiry(ID));

// ''';
//     db.execute(table);
//     //OFFICE ADDRESS VERIFICATION
//     table = '''
//           CREATE TABLE IF NOT EXISTS OfficeAddressDetails(OID INTEGER PRIMARY KEY," +
//         		"MastID INTEGER,PersonType VARCHAR," +
//         		"WasActualAddressSame VARCHAR,CorrectAddress VARCHAR," +
//         		"EstablishedTime VARCHAR,WorksAtGivenAddress VARCHAR," +
//         		"GiveNewAddress VARCHAR, IsApplicantAvailable VARCHAR," +
//         		"GiveReason VARCHAR,MetPersonCNIC VARCHAR,CNICOS VARCHAR," +
//         		"CNICNo VARCHAR,Status VARCHAR," +
//         		"FOREIGN KEY(MastID) REFERENCES OfficeVerifications(OID));

// ''';
//     db.execute(table);
//     //OFFICE BUSINESS WORK DETAILS
//     table = '''
//           CREATE TABLE IF NOT EXISTS OfficeBusinessWorkDetails(OID INTEGER PRIMARY KEY," +
//         		"MastID INTEGER,PersonType VARCHAR," +
//         		"TypeOfBusiness VARCHAR,OtherTypeOfBusiness VARCHAR," +
//         		"NatureOfBusiness VARCHAR,OtherNatureOfBusiness VARCHAR," +
//         		"ApplicantIsA VARCHAR, MentionOther VARCHAR,MentionRent VARCHAR," +
//         		"BusinessLegalEntity VARCHAR,GovtEmpBusinessLegalEntity VARCHAR," +
//         		"NamePlateAffixed VARCHAR,SizeApproxArea VARCHAR,BusinessActivity VARCHAR," +
//         		"NoOfEmployees VARCHAR,BusinessEstablishedSince VARCHAR," +
//         		"BankStatementVerified VARCHAR,Status VARCHAR," +
//         		"FOREIGN KEY(MastID) REFERENCES OfficeVerifications(OID));

// ''';
//     db.execute(table);
//     //OFFICE NEIGHBOUR MARKET CHECK
//     table = '''
//           CREATE TABLE IF NOT EXISTS OfficeNeighborMarketCheck(OID INTEGER PRIMARY KEY," +
//         		"MastID INTEGER,PersonType VARCHAR,NeighborName VARCHAR," +
//         		"NeighborAddress VARCHAR,KnowsApplicant VARCHAR, " +
//         		"KnowsHowLong VARCHAR, NeighborComments VARCHAR," +
//         		"BusinessEstablishedSinceMarketCheck VARCHAR,Status VARCHAR," +
//         		"FOREIGN KEY(MastID) REFERENCES OfficeVerifications(OID));

// ''';
//     db.execute(table);
//     //OFFICE HR DETAILS
//     table = '''
//           CREATE TABLE IF NOT EXISTS OfficeHRDetails(OID INTEGER PRIMARY KEY," +
//         		"MastID INTEGER,PersonType VARCHAR,NameOfPersonToMet VARCHAR," +
//         		"OHrKnowsApplicant VARCHAR,ApplicantEmploymentStatus VARCHAR, " +
//         		"ApplicantEmploymentPeriod VARCHAR, ApplicantDesignation VARCHAR," +
//         		"OHrNatureOfBusiness VARCHAR,OtherOHrNatureOfBusiness VARCHAR," +
//         		"GrossSalary VARCHAR,NetTakeHomeSalary VARCHAR,SalarySlipVerified VARCHAR, " +
//         		"BankStatementVerified VARCHAR,Status VARCHAR," +
//         		"FOREIGN KEY(MastID) REFERENCES OfficeVerifications(OID));

// ''';
//     db.execute(table);
//     //BANK STATEMENT VERIFICATION
//     table = '''
//           CREATE TABLE IF NOT EXISTS BankStatementVerifications(ID INTEGER PRIMARY KEY," +
//         		"MastID INTEGER,UserID VARCHAR,PersonType VARCHAR," +
//         		"PersonName VARCHAR,PersonContactNo VARCHAR,BankName VARCHAR," +
//         		"BankAddress VARCHAR,NearestLandmark VARCHAR," +
//         		"GeneralComments VARCHAR,OutComeVerification VARCHAR," +
//         		"GpsLocation VARCHAR,GpsURL VARCHAR," +
//         		"Status VARCHAR,StatusDate VARCHAR, isSync VARCHAR ,OrderTop INTEGER," +
//         		"FOREIGN KEY(MastID) REFERENCES Inquiry(ID));

// ''';
//     db.execute(table);
//     //SALARYSLIP VERIFICATION
//     table = '''
//           CREATE TABLE IF NOT EXISTS SalarySlipVerifications(ID INTEGER PRIMARY KEY," +
//         		"MastID INTEGER,UserID VARCHAR,PersonType VARCHAR," +
//         		"PersonName VARCHAR,PersonContactNo VARCHAR," +
//         		"OfficeName VARCHAR,OfficeAddress VARCHAR,NearestLandmark VARCHAR," +
//         		"GeneralComments VARCHAR,OutComeVerification VARCHAR," +
//         		"GpsLocation VARCHAR,GpsURL VARCHAR," +
//         		"Status VARCHAR,StatusDate VARCHAR, isSync VARCHAR, OrderTop INTEGER," +
//         		"FOREIGN KEY(MastID) REFERENCES Inquiry(ID));

// ''';
//     db.execute(table);
//     //TENANT VERIFICATION
//     table = '''
//           CREATE TABLE IF NOT EXISTS TenantVerifications(ID INTEGER PRIMARY KEY," +
//         		"MastID INTEGER,UserID VARCHAR,PersonType VARCHAR," +
//         		"PersonName VARCHAR,PersonContactNo VARCHAR," +
//         		"TenantAddress VARCHAR,NearestLandmark VARCHAR," +
//         		"TenantName VARCHAR, TenantContactNo VARCHAR," +
//         		"TenantCNIC VARCHAR,TenancyPeriod VARCHAR," +
//         		"TenantRent VARCHAR," +
//         		"GeneralComments VARCHAR,OutComeVerification VARCHAR," +
//         		"GpsLocation VARCHAR,GpsURL VARCHAR," +
//         		"Status VARCHAR,StatusDate VARCHAR, isSync VARCHAR,OrderTop INTEGER," +
//         		"FOREIGN KEY(MastID) REFERENCES Inquiry(ID));

// ''';
//     db.execute(table);
//   }
// }

// Future<Database> initializeDatabase(String dbname) async {
//   String documentDirectory = await getDatabasesPath();
//   String databasePath = documentDirectory + 'logindata.db';

//   //open the database
//   Database database = await openDatabase(databasePath, version: 1,
//       onCreate: (Database db, int version) async {
//     await db.execute('${dbname}');
//   });
//   return database;
// }
