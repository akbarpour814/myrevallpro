// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:http/http.dart';

Future<dynamic> uploadFile(
  FFUploadedFile file,
  String apiKey,
) async {
  // create an action like flutterflow api call for post with form data
// Define the API endpoint URL
  final String url = 'https://taskerpage.com/api/method/upload_file';

// Create a new multipart request
  final request = MultipartRequest('POST', Uri.parse(url));

// Add the file to the request
  if (file.name != null) {
    final String filePath = file.name ?? "file.png";
    request.files.add(await MultipartFile.fromPath('file', filePath));
  }
// Add the API key to the request headers
  request.headers['Authorization'] = apiKey;

// Send the request and wait for the response
  final response = await request.send();

// Parse the response body as JSON
  final responseBody = await response.stream.bytesToString();
  final json = jsonDecode(responseBody);

// Return the JSON response
  return json;
}
