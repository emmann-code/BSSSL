// ignore_for_file: avoid_print, non_constant_identifier_names

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

const String baseUrl = 'https://bsslapidemo.dcontroller.com';

// Change of bank Details
// getting the list of saved records
Future<dynamic> GetListOfSavedRecords(String token) async {
  final url = Uri.https(
    'bsslapidemo.dcontroller.com',
    '/api/ChangeOfBankDetails/BankDetailsList',
    {
      'staffid': "10604",
    },
  );

  print('Request URL: $url');

  try {
    final response = await http.get(
      url,
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
    );

    print('Response Status Code: ${response.statusCode}');

    if (response.statusCode == 200) {
      print('Response body: ${response.body}');
      final decoded = jsonDecode(response.body);

      if (decoded is Map<String, dynamic>) {
        return decoded;
      } else if (decoded is List) {
        return decoded;
      } else {
        print('Unexpected response format.');
        return null;
      }
    } else {
      print('Failed to load data. Status code: ${response.statusCode}');
      print('Response: ${response.body}');
      return null;
    }
  } catch (e) {
    print('An error occurred: $e');
    return null;
  }
}

// getting single saved records
Future<dynamic> GetSingleSavedRecords(String token) async {
  final url = Uri.https(
    'bsslapidemo.dcontroller.com',
    '/api/ChangeOfBankDetails/BankDetailsRefno',
    {
      'staffid': "10604",
      'refno': "10604",
    },
  );

  print('Request URL: $url');

  try {
    final response = await http.get(
      url,
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
    );

    print('Response Status Code: ${response.statusCode}');

    if (response.statusCode == 200) {
      print('Response body: ${response.body}');
      final decoded = jsonDecode(response.body);

      if (decoded is Map<String, dynamic>) {
        return decoded;
      } else if (decoded is List) {
        return decoded;
      } else {
        print('Unexpected response format.');
        return null;
      }
    } else {
      print('Failed to load data. Status code: ${response.statusCode}');
      print('Response: ${response.body}');
      return null;
    }
  } catch (e) {
    print('An error occurred: $e');
    return null;
  }
}

// Getting the bank names
Future<dynamic> GetBankNames(String token) async {
  final url = Uri.https('bsslapidemo.dcontroller.com',
      '/api/GeneralCode/GetListofBanks/GetListofBanks');

  print('Request URL: $url');

  try {
    final response = await http.get(
      url,
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
    );

    print('Response Status Code: ${response.statusCode}');

    if (response.statusCode == 200) {
      print('Response body: ${response.body}');
      final decoded = jsonDecode(response.body);

      if (decoded is Map<String, dynamic>) {
        return decoded;
      } else if (decoded is List) {
        return decoded;
      } else {
        print('Unexpected response format.');
        return null;
      }
    } else {
      print('Failed to load data. Status code: ${response.statusCode}');
      print('Response: ${response.body}');
      return null;
    }
  } catch (e) {
    print('An error occurred: $e');
    return null;
  }
}

// Save Bank details Record
Future<dynamic> SaveBankDetails(String token) async {
  final url = Uri.https('bsslapidemo.dcontroller.com',
      '/api/ChangeOfBankDetails/BankDetails', {'todo': 'save'});

  final body = jsonEncode({
    "id": 0,
    "staffid": "10604",
    "oldbankCode": "string",
    "oldbankname": "string",
    "oldacctype": "string",
    "oldacctypeCode": "string",
    "oldacctno": "string",
    "oldsortcode": "string",
    "newbankcode": "string",
    "newbankname": "string",
    "newacctype": "string",
    "newaccttypeCode": "string",
    "newacctno": "string",
    "newsortcode": "string",
    "dateIn": "2024-11-21T11:05:15.106Z",
    "modiDate": "2024-11-21T11:05:15.106Z",
    "modiby": "string",
    "inby": "string",
    "flag": "string",
    "name": "string",
    "message": "string",
    "prebyName": "string",
    "preby": "string",
    "preForName": "string",
    "preFor": "string",
    "memotype": "string",
    "copny": "string",
    "zcopny": "string",
    "acyear": "string",
    "acPeriod": "string",
    "refno": "string",
    "filePath": "string",
    "scanFilePath": "string",
    "addFilePath": "string",
    "scanAddFilePath": "string"
  });

  print('Request Body: $body');

  final response = await http.post(
    url,
    headers: {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json',
    },
    body: body,
  );

  print('Status Code: ${response.statusCode}');

  if (response.statusCode == 200) {
    final data = jsonDecode(response.body);
    print('Data: $data');
  } else {
    throw Exception(
        'Failed to save records. Status code: ${response.statusCode}');
  }
}

// Staff Training Development Appraisal
// 	Get staff reference number
Future<dynamic> GetStaffRefNo(String token) async {
  final url = Uri.https(
      'bsslapidemo.dcontroller.com',
      'api/StaffTrainingDevApp/GetStaffRefNo',
      {'staffid': '10604', 'refno': '10604', 'acyear': '2019'});

  print('Request URL: $url');

  try {
    final response = await http.get(
      url,
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
    );

    print('Response Status Code: ${response.statusCode}');

    if (response.statusCode == 200) {
      print('Response body: ${response.body}');
      final decoded = jsonDecode(response.body);

      if (decoded is Map<String, dynamic>) {
        return decoded;
      } else if (decoded is List) {
        return decoded;
      } else {
        print('Unexpected response format.');
        return null;
      }
    } else {
      print('Failed to load data. Status code: ${response.statusCode}');
      print('Response: ${response.body}');
      return null;
    }
  } catch (e) {
    print('An error occurred: $e');
    return null;
  }
}

// Load Staff record
Future<dynamic> GetStaff(String token) async {
  final url = Uri.https(
      'bsslapidemo.dcontroller.com',
      'api/StaffTrainingDevApp/GetStaff',
      {'staffid': '10604', 'acyear': '2019'});

  print('Request URL: $url');

  try {
    final response = await http.get(
      url,
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
    );

    print('Response Status Code: ${response.statusCode}');

    if (response.statusCode == 200) {
      print('Response body: ${response.body}');
      final decoded = jsonDecode(response.body);

      if (decoded is Map<String, dynamic>) {
        return decoded;
      } else if (decoded is List) {
        return decoded;
      } else {
        print('Unexpected response format.');
        return null;
      }
    } else {
      print('Failed to load data. Status code: ${response.statusCode}');
      print('Response: ${response.body}');
      return null;
    }
  } catch (e) {
    print('An error occurred: $e');
    return null;
  }
}

// Load list of saved record
Future<dynamic> GetStaffList(String token) async {
  final url = Uri.https(
      'bsslapidemo.dcontroller.com', 'api/StaffTrainingDevApp/GetStaffList', {
    'staffid': '10604',
  });

  print('Request URL: $url');

  try {
    final response = await http.get(
      url,
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
    );

    print('Response Status Code: ${response.statusCode}');

    if (response.statusCode == 200) {
      print('Response body: ${response.body}');
      final decoded = jsonDecode(response.body);

      if (decoded is Map<String, dynamic>) {
        return decoded;
      } else if (decoded is List) {
        return decoded;
      } else {
        print('Unexpected response format.');
        return null;
      }
    } else {
      print('Failed to load data. Status code: ${response.statusCode}');
      print('Response: ${response.body}');
      return null;
    }
  } catch (e) {
    print('An error occurred: $e');
    return null;
  }
}

// Save Record
Future<dynamic> SaveTrainigDevApp(String token) async {
  final url = Uri.https('bsslapidemo.dcontroller.com',
      'api/StaffTrainingDevApp/SaveRecord', {'todo': 'save'});

  final body = jsonEncode({
    "refno": "string",
    "refdate": "string",
    "staffid": "string",
    "name": "string",
    "appDate": "string",
    "designation": "string",
    "officeBran": "string",
    "mdept": "string",
    "depDesc": "string",
    "compCode": "string",
    "gradeLvl": "string",
    "gradeName": "string",
    "depCode": "string",
    "cat2": "string",
    "dept": "string",
    "presentDuty": "string",
    "trainingReq": "string",
    "sponsored": "string",
    "sponsoredComm": "string",
    "sponsoredDate": "2024-11-21T11:26:46.138Z",
    "partTime": "string",
    "partTimeComm": "string",
    "partTimeDate": "2024-11-21T11:26:46.138Z",
    "doneTrain": "string",
    "doneTrainCourse": "string",
    "newRecom": true,
    "doneTrainDate": "2024-11-21T11:26:46.138Z",
    "doneTrainDat": "string",
    "partTimeDat": "string",
    "sponsoredDat": "string",
    "doneTrainLoca": "string",
    "issaReturn": "string",
    "recomend": true,
    "signing": true,
    "approval": true,
    "rejected": true,
    "quanritineby": "string",
    "qaurantine": "string",
    "qaurantineReason": "string",
    "returnReason": "string",
    "reReason": "string",
    "genRemarks": "string",
    "senderkeyid": "string",
    "rsmemo": true,
    "achive": "string",
    "flag": true,
    "keyId": 0,
    "acyear": "string",
    "refEncry": "string",
    "recordExist": 0,
    "imageName": "string",
    "qualRec": [
      {
        "keyId": 0,
        "quaType": "string",
        "quaYear": "string",
        "refno": "string",
        "copny": "string",
        "zCopny": "string",
        "acYear": "string",
        "staffid": "string"
      }
    ]
  });

  print('Request Body: $body');

  final response = await http.post(
    url,
    headers: {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json',
    },
    body: body,
  );

  print('Status Code: ${response.statusCode}');

  if (response.statusCode == 200) {
    final data = jsonDecode(response.body);
    print('Data: $data');
  } else {
    throw Exception(
        'Failed to save records. Status code: ${response.statusCode}');
  }
}

// RequestToAddOrAlterNextOfKinDetails
// Get single saved Record
Future<dynamic> GetNextOfKinDetails(String token) async {
  final url = Uri.https(
      'bsslapidemo.dcontroller.com',
      'api/NextofKinDetails/GetStaffDefault',
      {'staffid': '10604', 'refno': '10604'});

  print('Request URL: $url');

  try {
    final response = await http.get(
      url,
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
    );

    print('Response Status Code: ${response.statusCode}');

    if (response.statusCode == 200) {
      print('Response body: ${response.body}');
      final decoded = jsonDecode(response.body);

      if (decoded is Map<String, dynamic>) {
        return decoded;
      } else if (decoded is List) {
        return decoded;
      } else {
        print('Unexpected response format.');
        return null;
      }
    } else {
      print('Failed to load data. Status code: ${response.statusCode}');
      print('Response: ${response.body}');
      return null;
    }
  } catch (e) {
    print('An error occurred: $e');
    return null;
  }
}

// Save Record
Future<dynamic> SaveNextOfKinDetails(String token) async {
  final url = Uri.https('bsslapidemo.dcontroller.com',
      'api/NextofKinDetails/SaveRecord', {'nos': 5});

  final body = jsonEncode({
    "id": 0,
    "referenceNo": "string",
    "staffName": "string",
    "staffId": "string",
    "kinName": "string",
    "kinAddress": "string",
    "kinPhoneNo": "string",
    "email": "string",
    "kinPic": "string",
    "kinRship": "string",
    "rank": "string",
    "allocPercentage": "string",
    "kinBenfac": "string",
    "department": "string",
    "reqDate": "2024-11-21T12:22:52.911Z",
    "compCode": "string",
    "officeCode": "string"
  });

  print('Request Body: $body');

  final response = await http.post(
    url,
    headers: {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json',
    },
    body: body,
  );

  print('Status Code: ${response.statusCode}');

  if (response.statusCode == 200) {
    final data = jsonDecode(response.body);
    print('Data: $data');
  } else {
    throw Exception(
        'Failed to save records. Status code: ${response.statusCode}');
  }
}

// LeaveRoster
// Get single saved Record
Future<dynamic> GetLeaveRosterDetails(String token) async {
  print('entering the leave roster');
  final url = Uri.https('bsslapidemo.dcontroller.com',
      'api/LeaveRoster/GetleaveRosterDetails/GetleaveRosterDetails', {
    'staffID': '10604',
  });

  print('Request URL: $url');

  try {
    final response = await http.get(
      url,
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
    );

    print('Response Status Code: ${response.statusCode}');

    if (response.statusCode == 200) {
      print('Response body: ${response.body}');
      final decoded = jsonDecode(response.body);

      if (decoded is Map<String, dynamic>) {
        return decoded;
      } else if (decoded is List) {
        return decoded;
      } else {
        print('Unexpected response format.');
        return null;
      }
    } else {
      print('Failed to load data. Status code: ${response.statusCode}');
      print('Response: ${response.body}');
      return null;
    }
  } catch (e) {
    print('An error occurred: $e');
    return null;
  }
}

// Get single saved Record
Future<dynamic> GetRosterDateChange(String token) async {
  final url = Uri.https(
    'bsslapidemo.dcontroller.com',
    'api/LeaveRoster/GetRosterDateChange/GetRosterDateChange',
    {
      'lyear': '10604',
      'leaveBal': '10000',
      'startdate': '12/19/2019',
      'lvDateStatus': '12/19/2019',
      'roDateStatus': '12/19/2019',
    },
  );

  print('Request URL: $url');

  try {
    final response = await http.get(
      url,
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
    );

    print('Response Status Code: ${response.statusCode}');

    if (response.statusCode == 200) {
      print('Response body: ${response.body}');
      return jsonDecode(response.body);
    } else {
      print('Failed to load data. Status code: ${response.statusCode}');
      print('Response body: ${response.body}');
      return null;
    }
  } catch (e) {
    print('An error occurred: $e');
    return null;
  }
}

// Save Record
Future<dynamic> SaveLeaveRosterDate(String token) async {
  final url = Uri.https('bsslapidemo.dcontroller.com',
      'api/LeaveRoster/SaveLeaveRoasterDate/SaveRecord', {'todo': 5});

  final body = jsonEncode({
    "id": 0,
    "staffId": "string",
    "staffName": "string",
    "leaveBal": "string",
    "year": "string",
    "dateapplied": "string",
    "rosterSdate": "string",
    "rosterEdate": "string",
    "cdate": "string",
    "edate": "string",
    "compCode": "string",
    "referenceNo": "string",
    "saveStat": "string",
    "approved": "string",
    "sentForApproval": "string",
    "approvalStatus": "string",
    "lvDateStatus": "string",
    "roDateStatus": "string",
    "rejectReason": "string"
  });

  print('Request Body: $body');

  final response = await http.post(
    url,
    headers: {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json',
    },
    body: body,
  );

  print('Status Code: ${response.statusCode}');

  if (response.statusCode == 200) {
    final data = jsonDecode(response.body);
    print('Data: $data');
  } else {
    throw Exception(
        'Failed to save records. Status code: ${response.statusCode}');
  }
}







// Leave Application
// Get single saved Record
Future<dynamic> GetleaveRecord(String token) async {
  final url = Uri.https(
    'bsslapidemo.dcontroller.com',
    'api/LeaveApply/GetleaveRecord',
    {
      'StaffID': '10604',
      'refNo': '10604',
    },
  );

  print('Request URL: $url');

  try {
    final response = await http.get(
      url,
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
    );

    print('Response Status Code: ${response.statusCode}');

    if (response.statusCode == 200) {
      print('Response body: ${response.body}');
      return jsonDecode(response.body);
    } else {
      print('Failed to load data. Status code: ${response.statusCode}');
      print('Response body: ${response.body}');
      return null;
    }
  } catch (e) {
    print('An error occurred: $e');
    return null;
  }
}

// Get New Record
Future<dynamic> GetleaveNewRecord(String token) async {
  final url = Uri.https(
    'bsslapidemo.dcontroller.com',
    'api/LeaveApply/GetleaveRecordNew',
    {
      'StaffID': '10604',
    },
  );

  print('Request URL: $url');

  try {
    final response = await http.get(
      url,
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
    );

    print('Response Status Code: ${response.statusCode}');

    if (response.statusCode == 200) {
      print('Response body: ${response.body}');
      return jsonDecode(response.body);
    } else {
      print('Failed to load data. Status code: ${response.statusCode}');
      print('Response body: ${response.body}');
      return null;
    }
  } catch (e) {
    print('An error occurred: $e');
    return null;
  }
}

// Get Leave type
Future<dynamic> GetleaveType(String token) async {
  final url = Uri.https(
    'bsslapidemo.dcontroller.com',
    'api/LeaveApply/Getleavetype',
  );

  print('Request URL: $url');

  try {
    final response = await http.get(
      url,
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
    );

    print('Response Status Code: ${response.statusCode}');

    if (response.statusCode == 200) {
      print('Response body: ${response.body}');
      return jsonDecode(response.body);
    } else {
      print('Failed to load data. Status code: ${response.statusCode}');
      print('Response body: ${response.body}');
      return null;
    }
  } catch (e) {
    print('An error occurred: $e');
    return null;
  }
}

// Get Process type
Future<dynamic> GetProcessType(String token) async {
  final url = Uri.https('bsslapidemo.dcontroller.com',
      'api/LeaveApply/GetProcessType', {'requeststaffcode': 'String'});

  print('Request URL: $url');

  try {
    final response = await http.get(
      url,
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
    );

    print('Response Status Code: ${response.statusCode}');

    if (response.statusCode == 200) {
      print('Response body: ${response.body}');
      return jsonDecode(response.body);
    } else {
      print('Failed to load data. Status code: ${response.statusCode}');
      print('Response body: ${response.body}');
      return null;
    }
  } catch (e) {
    print('An error occurred: $e');
    return null;
  }
}

// Get Country list
Future<dynamic> GetCountryList(String token) async {
  final url = Uri.https(
      'bsslapidemo.dcontroller.com', 'api/GeneralCode/GetCountry/GetCountry');

  print('Request URL: $url');

  try {
    final response = await http.get(
      url,
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
    );

    print('Response Status Code: ${response.statusCode}');

    if (response.statusCode == 200) {
      print('Response body: ${response.body}');
      return jsonDecode(response.body);
    } else {
      print('Failed to load data. Status code: ${response.statusCode}');
      print('Response body: ${response.body}');
      return null;
    }
  } catch (e) {
    print('An error occurred: $e');
    return null;
  }
}

// Get State list
Future<dynamic> GetStateList(String token) async {
  final url = Uri.https(
      'bsslapidemo.dcontroller.com', 'api/GeneralCode/GetState/GetState');

  print('Request URL: $url');

  try {
    final response = await http.get(
      url,
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
    );

    print('Response Status Code: ${response.statusCode}');

    if (response.statusCode == 200) {
      print('Response body: ${response.body}');
      return jsonDecode(response.body);
    } else {
      print('Failed to load data. Status code: ${response.statusCode}');
      print('Response body: ${response.body}');
      return null;
    }
  } catch (e) {
    print('An error occurred: $e');
    return null;
  }
}

// Get City list
Future<dynamic> GetCityList(String token) async {
  final url = Uri.https(
      'bsslapidemo.dcontroller.com', 'api/GeneralCode/GetCity/GetCity');

  print('Request URL: $url');

  try {
    final response = await http.get(
      url,
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
    );

    print('Response Status Code: ${response.statusCode}');

    if (response.statusCode == 200) {
      print('Response body: ${response.body}');
      return jsonDecode(response.body);
    } else {
      print('Failed to load data. Status code: ${response.statusCode}');
      print('Response body: ${response.body}');
      return null;
    }
  } catch (e) {
    print('An error occurred: $e');
    return null;
  }
}

// Get leave type bal
Future<dynamic> GetLeaveTypeBal(String token) async {
  final url = Uri.https(
      'bsslapidemo.dcontroller.com',
      'api/LeaveApply/GetLeaveTYBal',
      {'staffid': '9701', 'leavetype': '', 'lyear': '', 'refno': ''});

  print('Request URL: $url');

  try {
    final response = await http.get(
      url,
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
    );

    print('Response Status Code: ${response.statusCode}');

    if (response.statusCode == 200) {
      print('Response body: ${response.body}');
      return jsonDecode(response.body);
    } else {
      print('Failed to load data. Status code: ${response.statusCode}');
      print('Response body: ${response.body}');
      return null;
    }
  } catch (e) {
    print('An error occurred: $e');
    return null;
  }
}

// Get Leave Change
Future<dynamic> GetLeaveChange(String token) async {
  final url = Uri.https(
      'bsslapidemo.dcontroller.com', 'api/LeaveApply/GetLeaveChange', {
    'option': '',
    'staffid': '',
    'leavetype': '',
    'lyear': '',
    'numberoddays': '',
    'startdate': '',
    'refno': ''
  });

  print('Request URL: $url');

  try {
    final response = await http.get(
      url,
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
    );

    print('Response Status Code: ${response.statusCode}');

    if (response.statusCode == 200) {
      print('Response body: ${response.body}');
      return jsonDecode(response.body);
    } else {
      print('Failed to load data. Status code: ${response.statusCode}');
      print('Response body: ${response.body}');
      return null;
    }
  } catch (e) {
    print('An error occurred: $e');
    return null;
  }
}

// Save Record
Future<dynamic> SaveLeaveApply(String token) async {
  final url = Uri.https('bsslapidemo.dcontroller.com',
      'api/LeaveApply/SaveRecord', {'todo': 'save'});

  final body = jsonEncode({
    "id": 0,
    "lRef": "string",
    "year": "string",
    "staffId": "string",
    "names": "string",
    "ltype": "string",
    "cdate": "string",
    "edate": "string",
    "rdate": "string",
    "rsat": "string",
    "days": 0,
    "laddress": "string",
    "lcity": "string",
    "lstate": "string",
    "lemail": "string",
    "lcountry": "string",
    "lphone": "string",
    "compcode": "string",
    "lcircum": "string",
    "reason": "string",
    "status": "string",
    "dateapplied": "2024-11-21T12:57:19.473Z",
    "bsalary": "string",
    "gradelvl": "string",
    "department": "string",
    "appointdate": "string",
    "designation": "string",
    "cadre": "string",
    "office": "string",
    "leaveDetailDays": "string",
    "leaveBalDays": "string",
    "leaveRunDays": "string",
    "processType": "string",
    "sentforappr": "string",
    "finalappval": "string",
    "addFilePath": "string",
    "fullFilePath": "string",
    "enforceDoc": "string",
    "leaveTypeDescription": "string",
    "leaveLetterFullPath": "string",
    "rossdate": "string",
    "rosedate": "string",
    "resumeType": "string",
    "resumed": "string"
  });

  print('Request Body: $body');

  final response = await http.post(
    url,
    headers: {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json',
    },
    body: body,
  );

  print('Status Code: ${response.statusCode}');

  if (response.statusCode == 200) {
    final data = jsonDecode(response.body);
    print('Data: $data');
  } else {
    throw Exception(
        'Failed to save records. Status code: ${response.statusCode}');
  }
}
