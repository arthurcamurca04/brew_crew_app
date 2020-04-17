import 'package:brew_crew/models/brew.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService{

  final String uid;

  DatabaseService({this.uid});

  //collection reference
  final CollectionReference brewCollection = 
    Firestore.instance.collection('brews');

  Future updateUserData(String sugars, String name, int strength) async{
    return await brewCollection.document(uid).setData({
      'sugars': sugars,
      'name': name,
      'strength': strength,
    });
  }

   //create a list brew object
  List<Brew> _brewListfromSnapshot(QuerySnapshot snapshot){
    return snapshot.documents.map((doc){
      return Brew(
        name: doc.data['name'] ?? '',
        sugars: doc.data['sugars'] ?? '0',
        strength: doc.data['strength'] ?? 0,
      );
    }).toList();
  } 


  //get brews stream
  Stream<List<Brew>> get brews{
    return brewCollection.snapshots()
      .map((snapshot) => _brewListfromSnapshot(snapshot));
  }

  
}