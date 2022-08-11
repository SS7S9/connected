/*
* Copyright 2021 Amazon.com, Inc. or its affiliates. All Rights Reserved.
*
* Licensed under the Apache License, Version 2.0 (the "License").
* You may not use this file except in compliance with the License.
* A copy of the License is located at
*
*  http://aws.amazon.com/apache2.0
*
* or in the "license" file accompanying this file. This file is distributed
* on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
* express or implied. See the License for the specific language governing
* permissions and limitations under the License.
*/

// NOTE: This file is generated and may not follow lint rules defined in your app
// Generated files can be excluded from analysis in analysis_options.yaml
// For more info, see: https://dart.dev/guides/language/analysis-options#excluding-code-from-analysis

// ignore_for_file: public_member_api_docs, annotate_overrides, dead_code, dead_codepublic_member_api_docs, depend_on_referenced_packages, file_names, library_private_types_in_public_api, no_leading_underscores_for_library_prefixes, no_leading_underscores_for_local_identifiers, non_constant_identifier_names, null_check_on_nullable_type_parameter, prefer_adjacent_string_concatenation, prefer_const_constructors, prefer_if_null_operators, prefer_interpolation_to_compose_strings, slash_for_doc_comments, sort_child_properties_last, unnecessary_const, unnecessary_constructor_name, unnecessary_late, unnecessary_new, unnecessary_null_aware_assignments, unnecessary_nullable_for_final_variable_declarations, unnecessary_string_interpolations, use_build_context_synchronously

import 'package:amplify_core/amplify_core.dart';
import 'Booking.dart';
import 'Chat.dart';
import 'Client.dart';
import 'Merchant.dart';
import 'Post.dart';
import 'SMS.dart';
import 'Staff.dart';

export 'Booking.dart';
export 'Chat.dart';
export 'Client.dart';
export 'Merchant.dart';
export 'Post.dart';
export 'SMS.dart';
export 'Staff.dart';

class ModelProvider implements ModelProviderInterface {
  @override
  String version = "61ae3d7938345f8a7b34da49dd313fcb";
  @override
  List<ModelSchema> modelSchemas = [Booking.schema, Chat.schema, Client.schema, Merchant.schema, Post.schema, SMS.schema, Staff.schema];
  static final ModelProvider _instance = ModelProvider();
  @override
  List<ModelSchema> customTypeSchemas = [];

  static ModelProvider get instance => _instance;
  
  ModelType getModelTypeByModelName(String modelName) {
    switch(modelName) {
      case "Booking":
        return Booking.classType;
      case "Chat":
        return Chat.classType;
      case "Client":
        return Client.classType;
      case "Merchant":
        return Merchant.classType;
      case "Post":
        return Post.classType;
      case "SMS":
        return SMS.classType;
      case "Staff":
        return Staff.classType;
      default:
        throw Exception("Failed to find model in model provider for model name: " + modelName);
    }
  }
}