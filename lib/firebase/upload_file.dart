import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart';

class UploadFile {
  Future<String> uploadImage(var imageFile) async {
    final Reference reference =
        FirebaseStorage.instance.ref().child(basename(imageFile.path));
    await reference.putFile(imageFile);
    return await reference.getDownloadURL();
  }
}
