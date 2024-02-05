// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class MyUserEntity extends Equatable {
  final String id;
  final String email;
  final String name;

  const MyUserEntity({required this.id, required this.email, required this.name});
  
  Map<String, dynamic> toDocument()
  {
    return {
      'id' : id, 
      'name' : name,
      'email' : email,
    };
  }


  @override
  List<Object?> get props => [id, email, name];


  static MyUserEntity fromDocument(Map<String, dynamic> map) {
    return MyUserEntity(
      id: map['id'] as String,
      email: map['email'] as String,
      name: map['name'] as String,
    );
  }

  @override
  String toString()
  {
    return '''UserEntity: {
      id: $id
      email: $email
      name: $name
    }''';
  }
}
