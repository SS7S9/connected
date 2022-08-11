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


/** This is an auto generated class representing the Merchant type in your schema. */
@immutable
class Merchant extends Model {
  static const classType = const _MerchantModelType();
  final String id;
  final String? _username;
  final String? _companyname;
  final String? _password;
  final String? _address;
  final String? _postalAddress;
  final String? _email;
  final int? _ABNnumber;
  final String? _ABNstatus;
  final String? _permission;
  final String? _addressLatitude;
  final String? _addressLongtitude;
  final String? _startTime;
  final TemporalDateTime? _createdAt;
  final TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;
  
  @override
  String getId() {
    return id;
  }
  
  String? get username {
    return _username;
  }
  
  String? get companyname {
    return _companyname;
  }
  
  String? get password {
    return _password;
  }
  
  String? get address {
    return _address;
  }
  
  String? get postalAddress {
    return _postalAddress;
  }
  
  String? get email {
    return _email;
  }
  
  int? get ABNnumber {
    return _ABNnumber;
  }
  
  String? get ABNstatus {
    return _ABNstatus;
  }
  
  String? get permission {
    return _permission;
  }
  
  String? get addressLatitude {
    return _addressLatitude;
  }
  
  String? get addressLongtitude {
    return _addressLongtitude;
  }
  
  String? get startTime {
    return _startTime;
  }
  
  TemporalDateTime? get createdAt {
    return _createdAt;
  }
  
  TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  const Merchant._internal({required this.id, username, companyname, password, address, postalAddress, email, ABNnumber, ABNstatus, permission, addressLatitude, addressLongtitude, startTime, createdAt, updatedAt}): _username = username, _companyname = companyname, _password = password, _address = address, _postalAddress = postalAddress, _email = email, _ABNnumber = ABNnumber, _ABNstatus = ABNstatus, _permission = permission, _addressLatitude = addressLatitude, _addressLongtitude = addressLongtitude, _startTime = startTime, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory Merchant({String? id, String? username, String? companyname, String? password, String? address, String? postalAddress, String? email, int? ABNnumber, String? ABNstatus, String? permission, String? addressLatitude, String? addressLongtitude, String? startTime}) {
    return Merchant._internal(
      id: id == null ? UUID.getUUID() : id,
      username: username,
      companyname: companyname,
      password: password,
      address: address,
      postalAddress: postalAddress,
      email: email,
      ABNnumber: ABNnumber,
      ABNstatus: ABNstatus,
      permission: permission,
      addressLatitude: addressLatitude,
      addressLongtitude: addressLongtitude,
      startTime: startTime);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Merchant &&
      id == other.id &&
      _username == other._username &&
      _companyname == other._companyname &&
      _password == other._password &&
      _address == other._address &&
      _postalAddress == other._postalAddress &&
      _email == other._email &&
      _ABNnumber == other._ABNnumber &&
      _ABNstatus == other._ABNstatus &&
      _permission == other._permission &&
      _addressLatitude == other._addressLatitude &&
      _addressLongtitude == other._addressLongtitude &&
      _startTime == other._startTime;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("Merchant {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("username=" + "$_username" + ", ");
    buffer.write("companyname=" + "$_companyname" + ", ");
    buffer.write("password=" + "$_password" + ", ");
    buffer.write("address=" + "$_address" + ", ");
    buffer.write("postalAddress=" + "$_postalAddress" + ", ");
    buffer.write("email=" + "$_email" + ", ");
    buffer.write("ABNnumber=" + (_ABNnumber != null ? _ABNnumber!.toString() : "null") + ", ");
    buffer.write("ABNstatus=" + "$_ABNstatus" + ", ");
    buffer.write("permission=" + "$_permission" + ", ");
    buffer.write("addressLatitude=" + "$_addressLatitude" + ", ");
    buffer.write("addressLongtitude=" + "$_addressLongtitude" + ", ");
    buffer.write("startTime=" + "$_startTime" + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  Merchant copyWith({String? id, String? username, String? companyname, String? password, String? address, String? postalAddress, String? email, int? ABNnumber, String? ABNstatus, String? permission, String? addressLatitude, String? addressLongtitude, String? startTime}) {
    return Merchant._internal(
      id: id ?? this.id,
      username: username ?? this.username,
      companyname: companyname ?? this.companyname,
      password: password ?? this.password,
      address: address ?? this.address,
      postalAddress: postalAddress ?? this.postalAddress,
      email: email ?? this.email,
      ABNnumber: ABNnumber ?? this.ABNnumber,
      ABNstatus: ABNstatus ?? this.ABNstatus,
      permission: permission ?? this.permission,
      addressLatitude: addressLatitude ?? this.addressLatitude,
      addressLongtitude: addressLongtitude ?? this.addressLongtitude,
      startTime: startTime ?? this.startTime);
  }
  
  Merchant.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _username = json['username'],
      _companyname = json['companyname'],
      _password = json['password'],
      _address = json['address'],
      _postalAddress = json['postalAddress'],
      _email = json['email'],
      _ABNnumber = (json['ABNnumber'] as num?)?.toInt(),
      _ABNstatus = json['ABNstatus'],
      _permission = json['permission'],
      _addressLatitude = json['addressLatitude'],
      _addressLongtitude = json['addressLongtitude'],
      _startTime = json['startTime'],
      _createdAt = json['createdAt'] != null ? TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'username': _username, 'companyname': _companyname, 'password': _password, 'address': _address, 'postalAddress': _postalAddress, 'email': _email, 'ABNnumber': _ABNnumber, 'ABNstatus': _ABNstatus, 'permission': _permission, 'addressLatitude': _addressLatitude, 'addressLongtitude': _addressLongtitude, 'startTime': _startTime, 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
  };

  static final QueryField ID = QueryField(fieldName: "id");
  static final QueryField USERNAME = QueryField(fieldName: "username");
  static final QueryField COMPANYNAME = QueryField(fieldName: "companyname");
  static final QueryField PASSWORD = QueryField(fieldName: "password");
  static final QueryField ADDRESS = QueryField(fieldName: "address");
  static final QueryField POSTALADDRESS = QueryField(fieldName: "postalAddress");
  static final QueryField EMAIL = QueryField(fieldName: "email");
  static final QueryField ABNNUMBER = QueryField(fieldName: "ABNnumber");
  static final QueryField ABNSTATUS = QueryField(fieldName: "ABNstatus");
  static final QueryField PERMISSION = QueryField(fieldName: "permission");
  static final QueryField ADDRESSLATITUDE = QueryField(fieldName: "addressLatitude");
  static final QueryField ADDRESSLONGTITUDE = QueryField(fieldName: "addressLongtitude");
  static final QueryField STARTTIME = QueryField(fieldName: "startTime");
  static var schema = Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "Merchant";
    modelSchemaDefinition.pluralName = "Merchants";
    
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
      key: Merchant.USERNAME,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Merchant.COMPANYNAME,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Merchant.PASSWORD,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Merchant.ADDRESS,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Merchant.POSTALADDRESS,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Merchant.EMAIL,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Merchant.ABNNUMBER,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Merchant.ABNSTATUS,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Merchant.PERMISSION,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Merchant.ADDRESSLATITUDE,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Merchant.ADDRESSLONGTITUDE,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Merchant.STARTTIME,
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

class _MerchantModelType extends ModelType<Merchant> {
  const _MerchantModelType();
  
  @override
  Merchant fromJson(Map<String, dynamic> jsonData) {
    return Merchant.fromJson(jsonData);
  }
}