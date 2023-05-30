import 'package:evs/Verifications/Residence_Verification/Applicant/Applicant_MainPage.dart';
import 'package:evs/Verifications/SalarySlip_verification/Salaryslip_verify.dart';
import 'package:evs/Widgets/Logs/Logeger.dart';
import 'package:flutter/material.dart';

import '../Module for Get Data/Inquires_response.dart';
import '../Verifications/Bank_Statement_Verification/Bank_state_verify.dart';
import '../Verifications/Office_Verification/Office_main.dart';
import '../Verifications/Tenent_verification/Tenant_verify.dart';

// ignore: must_be_immutable
class AssignedInquiries extends StatelessWidget {
  const AssignedInquiries(
      {super.key,
      this.residenceVerify,
      this.Officeverification,
      this.bankverification,
      this.tenantverification,
      this.salaryslipverification});
  final List<ResidenceVerifications>? residenceVerify;
  final List<WorkOfficeVerifications>? Officeverification;
  final List<BankStatementVerifications>? bankverification;
  final List<TenantVerifications>? tenantverification;
  final List<SalarySlipVerifications>? salaryslipverification;

  @override
  Widget build(BuildContext context) {
    try {
      return Scaffold(
        backgroundColor: Colors.white60,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Color(0xff392850),
          centerTitle: true,
          title: const Text(
            "Verification Types",
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontFamily: 'Calibri',
                fontSize: 22.0),
          ),
        ),
        body: WillPopScope(
          onWillPop: () async {
            Navigator.pop(context);
            return true;
          },
          child: SingleChildScrollView(
            child: Column(
              children: [
                if (bankverification != null)
                  ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: bankverification!.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      BankVerificationofStatment(
                                        bankofficeverified: bankverification,
                                        NameOfBank: bankverification![index]
                                            .BankName
                                            .toString(),
                                        NameOfPerson: bankverification![index]
                                            .PersonName
                                            .toString(),
                                        landmark: bankverification![index]
                                            .NearestLandMark
                                            .toString(),
                                        typeofPerson: bankverification![index]
                                            .PersonType
                                            .toString(),
                                      ))),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 5.0, right: 5.0, top: 2.0),
                            child: Card(
                              elevation: 3.0,
                              child: Container(
                                height: 230,
                                width: double.infinity,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 11.0, right: 5.0, top: 10.0),
                                  child: SingleChildScrollView(
                                    child: Column(
                                      children: <Widget>[
                                        Text(
                                          "${bankverification![index].PersonType}'s Bank Statement Verification",
                                          style: TextStyle(
                                              decoration:
                                                  TextDecoration.underline,
                                              fontSize: 25.0,
                                              fontFamily: 'Calibri',
                                              fontWeight: FontWeight.bold,
                                              color: Color(0xff392850),
                                              fontStyle: FontStyle.italic),
                                        ),
                                        const SizedBox(
                                          height: 7.0,
                                        ),
                                        Row(
                                          children: <Widget>[
                                            Text(
                                                "${bankverification![index].PersonType}'s Name: ",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.black,
                                                    fontSize: 20.0,
                                                    fontFamily: 'Calibri')),
                                            Expanded(
                                              child: Text(
                                                "${bankverification![index].PersonName}",
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 20.0,
                                                    fontFamily: 'Calibri'),
                                              ),
                                            )
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 2.0,
                                        ),
                                        Row(
                                          children: <Widget>[
                                            Text(
                                                "${bankverification![index].PersonType}'s Contact No: ",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.black,
                                                    fontSize: 20.0,
                                                    fontFamily: 'Calibri')),
                                            Text(
                                              "${bankverification![index].PersonContactNo}",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 20.0,
                                                  fontFamily: 'Calibri'),
                                            )
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 2.0,
                                        ),
                                        Row(
                                          children: <Widget>[
                                            const Text("Bank Name: ",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.black,
                                                    fontSize: 20.0,
                                                    fontFamily: 'Calibri')),
                                            Expanded(
                                              child: Text(
                                                "${bankverification![index].BankName}",
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 20.0,
                                                    fontFamily: 'Calibri'),
                                              ),
                                            )
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 2.0,
                                        ),
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            const Text("Bank Address: ",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.black,
                                                    fontSize: 20.0,
                                                    fontFamily: 'Calibri')),
                                            Expanded(
                                              child: Text(
                                                "${bankverification![index].BankAddress}",
                                                overflow: TextOverflow.clip,
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 20.0,
                                                    fontFamily: 'Calibri'),
                                              ),
                                            )
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 2.0,
                                        ),
                                        Row(
                                          children: <Widget>[
                                            const Text("Nearest Landmark: ",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.black,
                                                    fontSize: 20.0,
                                                    fontFamily: 'Calibri')),
                                            Expanded(
                                              child: Text(
                                                "${bankverification![index].NearestLandMark}",
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 20.0,
                                                    fontFamily: 'Calibri'),
                                              ),
                                            )
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 2.0,
                                        ),
                                        Row(
                                          children: <Widget>[
                                            const Text("Status:  ",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.black,
                                                    fontSize: 20.0,
                                                    fontFamily: 'Calibri')),
                                            Text(
                                              "${bankverification![index].Status}",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.orange,
                                                  fontSize: 21.0,
                                                  fontFamily: 'Calibri'),
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      }),
                if (residenceVerify != null)
                  ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: residenceVerify!.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        ApplicantResidenceverifiy(
                                          verifucationID:
                                              residenceVerify![index]
                                                  .ResidenceVerificationId!
                                                  .toInt(),
                                          residenceVerified: residenceVerify,
                                          PersonType: residenceVerify![index]
                                              .PersonType
                                              .toString(),
                                          residenceAddress:
                                              residenceVerify![index]
                                                  .ResidenceAddress
                                                  .toString(),
                                          nearestLandmark:
                                              residenceVerify![index]
                                                  .NearestLandMark
                                                  .toString(),
                                          NameofPerson: residenceVerify![index]
                                              .PersonName
                                              .toString(),
                                          InquiryId: residenceVerify![index]
                                              .InquiryId!
                                              .toInt(),
                                        )));
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 5.0, right: 5.0, top: 2.0),
                            child: Card(
                              elevation: 3.0,
                              child: Container(
                                constraints: BoxConstraints(maxHeight: 270),
                                // height: 200,
                                width: double.infinity,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 11.0, right: 5.0, top: 10.0),
                                  child: SingleChildScrollView(
                                    child: Column(
                                      children: <Widget>[
                                        Text(
                                          "${residenceVerify![index].PersonType} Residence Verification",
                                          style: TextStyle(
                                              decoration:
                                                  TextDecoration.underline,
                                              fontSize: 25.0,
                                              fontFamily: 'Calibri',
                                              fontWeight: FontWeight.bold,
                                              color: Color(0xff392850),
                                              fontStyle: FontStyle.italic),
                                        ),
                                        const SizedBox(
                                          height: 7.0,
                                        ),
                                        Row(
                                          children: <Widget>[
                                            Text(
                                                "${residenceVerify![index].PersonType}'s Name: ",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.black,
                                                    fontSize: 20.0,
                                                    fontFamily: 'Calibri')),
                                            Expanded(
                                              child: Text(
                                                "${residenceVerify![index].PersonName}",
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 20.0,
                                                    fontFamily: 'Calibri'),
                                              ),
                                            )
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 2.0,
                                        ),
                                        Row(
                                          children: <Widget>[
                                            Text(
                                                "${residenceVerify![index].PersonType}'s Contact No: ",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.black,
                                                    fontSize: 20.0,
                                                    fontFamily: 'Calibri')),
                                            Text(
                                              "${residenceVerify![index].PersonContactNo}",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 20.0,
                                                  fontFamily: 'Calibri'),
                                            )
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 2.0,
                                        ),
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            const Text("Residence Address: ",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.black,
                                                    fontSize: 20.0,
                                                    fontFamily: 'Calibri')),
                                            Expanded(
                                              child: Text(
                                                "${residenceVerify![index].ResidenceAddress}",
                                                overflow: TextOverflow.clip,
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 20.0,
                                                    fontFamily: 'Calibri'),
                                              ),
                                            )
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 2.0,
                                        ),
                                        Row(
                                          children: <Widget>[
                                            const Text("Nearest Landmark: ",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.black,
                                                    fontSize: 20.0,
                                                    fontFamily: 'Calibri')),
                                            Expanded(
                                              child: Text(
                                                "${residenceVerify![index].NearestLandMark}",
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 20.0,
                                                    fontFamily: 'Calibri'),
                                              ),
                                            )
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 2.0,
                                        ),
                                        Row(
                                          children: <Widget>[
                                            const Text("Status:  ",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.black,
                                                    fontSize: 20.0,
                                                    fontFamily: 'Calibri')),
                                            Text(
                                              "${residenceVerify![index].Status}",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.orange,
                                                  fontSize: 21.0,
                                                  fontFamily: 'Calibri'),
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      }),
                if (tenantverification != null)
                  ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: tenantverification!.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => VerificationofTenant(
                                        tenentverify: tenantverification,
                                        AddressofTenant:
                                            tenantverification![index]
                                                .TenantAddress
                                                .toString(),
                                        Landmark: tenantverification![index]
                                            .NearestLandMark
                                            .toString(),
                                        NameofPerson: tenantverification![index]
                                            .PersonName
                                            .toString(),
                                        typeofPerson: tenantverification![index]
                                            .PersonType
                                            .toString(),
                                      ))),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 5.0, right: 5.0, top: 2.0),
                            child: Card(
                              elevation: 3.0,
                              child: Container(
                                constraints: BoxConstraints(maxHeight: 300),
                                // height: 200,
                                width: double.infinity,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 11.0, right: 5.0, top: 10.0),
                                  child: SingleChildScrollView(
                                    child: Column(
                                      children: <Widget>[
                                        Text(
                                          "${tenantverification![index].PersonType}'s Tenant Verification",
                                          style: TextStyle(
                                              decoration:
                                                  TextDecoration.underline,
                                              fontSize: 25.0,
                                              fontFamily: 'Calibri',
                                              fontWeight: FontWeight.bold,
                                              color: Color(0xff392850),
                                              fontStyle: FontStyle.italic),
                                        ),
                                        const SizedBox(
                                          height: 7.0,
                                        ),
                                        Row(
                                          children: <Widget>[
                                            Text(
                                                "${tenantverification![index].PersonType}'s Name: ",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.black,
                                                    fontSize: 20.0,
                                                    fontFamily: 'Calibri')),
                                            Expanded(
                                              child: Text(
                                                "${tenantverification![index].PersonName}",
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 20.0,
                                                    fontFamily: 'Calibri'),
                                              ),
                                            )
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 2.0,
                                        ),
                                        Row(
                                          children: <Widget>[
                                            Text(
                                                "${tenantverification![index].PersonType}'s Contact No: ",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.black,
                                                    fontSize: 20.0,
                                                    fontFamily: 'Calibri')),
                                            Text(
                                              "${tenantverification![index].PersonContactNo}",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 20.0,
                                                  fontFamily: 'Calibri'),
                                            )
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 2.0,
                                        ),
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            const Text("Tenant Address: ",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.black,
                                                    fontSize: 20.0,
                                                    fontFamily: 'Calibri')),
                                            Expanded(
                                              child: Text(
                                                "${tenantverification![index].TenantAddress}",
                                                overflow: TextOverflow.clip,
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 20.0,
                                                    fontFamily: 'Calibri'),
                                              ),
                                            )
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 2.0,
                                        ),
                                        Row(
                                          children: <Widget>[
                                            const Text("Nearest Landmark: ",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.black,
                                                    fontSize: 20.0,
                                                    fontFamily: 'Calibri')),
                                            Expanded(
                                              child: Text(
                                                "${tenantverification![index].NearestLandMark}",
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 20.0,
                                                    fontFamily: 'Calibri'),
                                              ),
                                            )
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 2.0,
                                        ),
                                        Row(
                                          children: <Widget>[
                                            const Text("Status:  ",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.black,
                                                    fontSize: 20.0,
                                                    fontFamily: 'Calibri')),
                                            Text(
                                              "${tenantverification![index].Status}",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.orange,
                                                  fontSize: 21.0,
                                                  fontFamily: 'Calibri'),
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      }),
                if (salaryslipverification != null)
                  ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: salaryslipverification!.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SalaryVerification(
                                        salaryslipverify:
                                            salaryslipverification,
                                        AddressofOffice:
                                            salaryslipverification![index]
                                                .OfficeAddress
                                                .toString(),
                                        NameofOffice:
                                            salaryslipverification![index]
                                                .OfficeName
                                                .toString(),
                                        NameofPerson:
                                            salaryslipverification![index]
                                                .PersonName
                                                .toString(),
                                        typeofPerson:
                                            salaryslipverification![index]
                                                .PersonType
                                                .toString(),
                                        landmark: salaryslipverification![index]
                                            .NearestLandMark
                                            .toString(),
                                      ))),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 5.0, right: 5.0, top: 2.0),
                            child: Card(
                              elevation: 3.0,
                              child: Container(
                                constraints: BoxConstraints(maxHeight: 270),
                                width: double.infinity,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 11.0, right: 5.0, top: 10.0),
                                  child: SingleChildScrollView(
                                    child: Column(
                                      children: <Widget>[
                                        Text(
                                          "${salaryslipverification![index].PersonType} Salary Slip Verification",
                                          style: TextStyle(
                                              decoration:
                                                  TextDecoration.underline,
                                              fontSize: 25.0,
                                              fontFamily: 'Calibri',
                                              fontWeight: FontWeight.bold,
                                              color: Color(0xff392850),
                                              fontStyle: FontStyle.italic),
                                        ),
                                        const SizedBox(
                                          height: 7.0,
                                        ),
                                        Row(
                                          children: <Widget>[
                                            Text(
                                                "${salaryslipverification![index].PersonType}'s Name: ",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.black,
                                                    fontSize: 20.0,
                                                    fontFamily: 'Calibri')),
                                            Expanded(
                                              child: Text(
                                                "${salaryslipverification![index].PersonName}",
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 20.0,
                                                    fontFamily: 'Calibri'),
                                              ),
                                            )
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 2.0,
                                        ),
                                        Row(
                                          children: <Widget>[
                                            Text(
                                                "${salaryslipverification![index].PersonType}'s Contact No: ",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.black,
                                                    fontSize: 20.0,
                                                    fontFamily: 'Calibri')),
                                            Text(
                                              "${salaryslipverification![index].PersonContactNo}",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 20.0,
                                                  fontFamily: 'Calibri'),
                                            )
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 2.0,
                                        ),
                                        Row(
                                          children: <Widget>[
                                            const Text("Office Name: ",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.black,
                                                    fontSize: 20.0,
                                                    fontFamily: 'Calibri')),
                                            Expanded(
                                              child: Text(
                                                "${salaryslipverification![index].OfficeName}",
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 20.0,
                                                    fontFamily: 'Calibri'),
                                              ),
                                            )
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 2.0,
                                        ),
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            const Text("Office Address: ",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.black,
                                                    fontSize: 20.0,
                                                    fontFamily: 'Calibri')),
                                            Expanded(
                                              child: Text(
                                                "${salaryslipverification![index].OfficeAddress}",
                                                overflow: TextOverflow.clip,
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 20.0,
                                                    fontFamily: 'Calibri'),
                                              ),
                                            )
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 2.0,
                                        ),
                                        Row(
                                          children: <Widget>[
                                            const Text("Nearest Landmark: ",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.black,
                                                    fontSize: 20.0,
                                                    fontFamily: 'Calibri')),
                                            Expanded(
                                              child: Text(
                                                "${salaryslipverification![index].NearestLandMark}",
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 20.0,
                                                    fontFamily: 'Calibri'),
                                              ),
                                            )
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 2.0,
                                        ),
                                        Row(
                                          children: <Widget>[
                                            const Text("Status:  ",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.black,
                                                    fontSize: 20.0,
                                                    fontFamily: 'Calibri')),
                                            Text(
                                              "${salaryslipverification![index].Status}",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.orange,
                                                  fontSize: 21.0,
                                                  fontFamily: 'Calibri'),
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      }),
                if (Officeverification != null)
                  ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: Officeverification!.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => VerificationOfOffice(
                                          workofficeverified:
                                              Officeverification,
                                          AddressofOffice:
                                              Officeverification![index]
                                                  .OfficeAddress
                                                  .toString(),
                                          Landmark: Officeverification![index]
                                              .NearestLandMark
                                              .toString(),
                                          NameofOffice:
                                              Officeverification![index]
                                                  .OfficeName
                                                  .toString(),
                                          NameofPerson:
                                              Officeverification![index]
                                                  .PersonName
                                                  .toString(),
                                          typeofPerson:
                                              Officeverification![index]
                                                  .PersonType
                                                  .toString(),
                                        )));
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 5.0, right: 5.0, top: 2.0),
                            child: Card(
                              elevation: 3.0,
                              child: Container(
                                height: 300,
                                width: double.infinity,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 11.0, right: 5.0, top: 10.0),
                                  child: SingleChildScrollView(
                                    child: Column(
                                      children: <Widget>[
                                        Text(
                                          "${Officeverification![index].PersonType} Office/Business Verification",
                                          style: TextStyle(
                                              decoration:
                                                  TextDecoration.underline,
                                              fontSize: 25.0,
                                              fontFamily: 'Calibri',
                                              fontWeight: FontWeight.bold,
                                              color: Color(0xff392850),
                                              fontStyle: FontStyle.italic),
                                        ),
                                        const SizedBox(
                                          height: 7.0,
                                        ),
                                        Row(
                                          children: <Widget>[
                                            Text(
                                                "${Officeverification![index].PersonType}'s Name: ",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.black,
                                                    fontSize: 20.0,
                                                    fontFamily: 'Calibri')),
                                            Expanded(
                                              child: Text(
                                                "${Officeverification![index].PersonName}",
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 20.0,
                                                    fontFamily: 'Calibri'),
                                              ),
                                            )
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 2.0,
                                        ),
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Text(
                                                "${Officeverification![index].PersonType}'s Contact No: ",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.black,
                                                    fontSize: 20.0,
                                                    fontFamily: 'Calibri')),
                                            Text(
                                              "${Officeverification![index].PersonContactNo}",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 20.0,
                                                  fontFamily: 'Calibri'),
                                            )
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 2.0,
                                        ),
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            const Text("Company/Office Name: ",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.black,
                                                    fontSize: 20.0,
                                                    fontFamily: 'Calibri')),
                                            Expanded(
                                              child: Text(
                                                "${Officeverification![index].OfficeName}",
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 20.0,
                                                    fontFamily: 'Calibri'),
                                              ),
                                            )
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 2.0,
                                        ),
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            const Text(
                                                "Company/Office Address: ",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.black,
                                                    fontSize: 20.0,
                                                    fontFamily: 'Calibri')),
                                            Expanded(
                                              child: Text(
                                                "${Officeverification![index].OfficeAddress}",
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 20.0,
                                                    fontFamily: 'Calibri'),
                                              ),
                                            )
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 2.0,
                                        ),
                                        Row(
                                          children: <Widget>[
                                            const Text("Nearest Landmark: ",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.black,
                                                    fontSize: 20.0,
                                                    fontFamily: 'Calibri')),
                                            Expanded(
                                              child: Text(
                                                "${Officeverification![index].NearestLandMark}",
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 20.0,
                                                    fontFamily: 'Calibri'),
                                              ),
                                            )
                                          ],
                                        ),
                                        SizedBox(
                                          height: 2.0,
                                        ),
                                        Row(
                                          children: <Widget>[
                                            const Text("Status:  ",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.black,
                                                    fontSize: 20.0,
                                                    fontFamily: 'Calibri')),
                                            Text(
                                              "${Officeverification![index].Status}",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.orange,
                                                  fontSize: 21.0,
                                                  fontFamily: 'Calibri'),
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      }),
              ],
            ),
          ),
        ),
      );
    } on Exception catch (e) {
      EVSLogger.appendLog(e.toString());
      throw e;
    }
  }
}
