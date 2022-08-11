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
import 'package:flutter/foundation.dart';


/** This is an auto generated class representing the Client type in your schema. */
@immutable
class Client extends Model {
  static const classType = const _ClientModelType();
  final String id;
  final String? _username;
  final String? _firstname;
  final String? _lastname;
  final String? _passowrd;
  final String? _mobile;
  final String? _email;
  final String? _notice;
  final TemporalDateTime? _createdAt;
  final TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;
  
  @override
  String getId() {
    return id;
  }
  
  String get username {
    try {
      return _username!;
    } catch(e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String? get firstname {
    return _firstname;
  }
  
  String? get lastname {
    return _lastname;
  }
  
  String? get passowrd {
    return _passowrd;
  }
  
  String? get mobile {
    return _mobile;
  }
  
  String? get email {
    return _email;
  }
  
  String? get notice {
    return _notice;
  }
  
  TemporalDateTime? get createdAt {
    return _createdAt;
  }
  
  TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  const Client._internal({required this.id, required username, firstname, lastname, passowrd, mobile, email, notice, createdAt, updatedAt}): _username = username, _firstname = firstname, _lastname = lastname, _passowrd = passowrd, _mobile = mobile, _email = email, _notice = notice, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory Client({String? id, required String username, String? firstname, String? lastname, String? passowrd, String? mobile, String? email, String? notice}) {
    return Client._internal(
      id: id == null ? UUID.getUUID() : id,
      username: username,
      firstname: firstname,
      lastname: lastname,
      passowrd: passowrd,
      mobile: mobile,
      email: email,
      notice: notice);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Client &&
      id == other.id &&
      _username == other._username &&
      _firstname == other._firstname &&
      _lastname == other._lastname &&
      _passowrd == other._passowrd &&
      _mobile == other._mobile &&
      _email == other._email &&
      _notice == other._notice;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("Client {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("username=" + "$_username" + ", ");
    buffer.write("firstname=" + "$_firstname" + ", ");
    buffer.write("lastname=" + "$_lastname" + ", ");
    buffer.write("passowrd=" + "$_passowrd" + ", ");
    buffer.write("mobile=" + "$_mobile" + ", ");
    buffer.write("email=" + "$_email" + ", ");
    buffer.write("notice=" + "$_notice" + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  Client copyWith({String? id, String? username, String? firstname, String? lastname, String? passowrd, String? mobile, String? email, String? notice}) {
    return Client._internal(
      id: id ?? this.id,
      username: username ?? this.username,
      firstname: firstname ?? this.firstname,
      lastname: lastname ?? this.lastname,
      passowrd: passowrd ?? this.passowrd,
      mobile: mobile ?? this.mobile,
      email: email ?? this.email,
      notice: notice ?? this.notice);
  }
  
  Client.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _username = json['username'],
      _firstname = json['firstname'],
      _lastname = json['lastname'],
      _passowrd = json['passowrd'],
      _mobile = json['mobile'],
      _email = json['email'],
      _notice = json['notice'],
      _createdAt = json['createdAt'] != null ? TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'username': _username, 'firstname': _firstname, 'lastname': _lastname, 'passowrd': _passowrd, 'mobile': _mobile, 'email': _email, 'notice': _notice, 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
  };

  static final QueryField ID = QueryField(fieldName: "id");
  static final QueryField USERNAME = QueryField(fieldName: "username");
  static final QueryField FIRSTNAME = QueryField(fieldName: "firstname");
  static final QueryField LASTNAME = QueryField(fieldName: "lastname");
  static final QueryField PASSOWRD = QueryField(fieldName: "passowrd");
  static final QueryField MOBILE = QueryField(fieldName: "mobile");
  static final QueryField EMAIL = QueryField(fieldName: "email");
  static final QueryField NOTICE = QueryField(fieldName: "notice");
  static var schema = Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "Client";
    modelSchemaDefinition.pluralName = "Clients";
    
    modelSchemaDefinition.authRules = [
      AuthRule(
        authStrategy: AuthStrategy.PUBLIC,
        operations: [
          ModelOperation.CREATE,
          ModelOperation.UPDATE,
          ModelOperation.DELETE,
          ModelOperation.READ
        ])
    ];
    
    modelSchemaDefinition.addField(ModelFieldDefinition.id());
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Client.USERNAME,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Client.FIRSTNAME,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Client.LASTNAME,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Client.PASSOWRD,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Client.MOBILE,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Client.EMAIL,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Client.NOTICE,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.nonQueryField(
      fieldName: 'createdAt',
      isRequired: false,
      isReadOnly: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.dateTime)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.nonQueryField(
      fieldName: 'updatedAt',
      isRequired: false,
      isReadOnly: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.dateTime)
    ));
  });
}

class _ClientModelType extends ModelType<Client> {
  const _ClientModelType();
  
  @override
  Client fromJson(Map<String, dynamic> jsonData) {
    return Client.fromJson(jsonData);
  }
}