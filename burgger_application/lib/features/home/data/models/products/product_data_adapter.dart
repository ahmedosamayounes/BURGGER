import 'package:hive/hive.dart';

import 'products_model.dart'; 

class ProductDataAdapter extends TypeAdapter<ProductData> {
  @override
  final int typeId = 0; 

  @override
  ProductData read(BinaryReader reader) {
    return ProductData(
      id: reader.read(),          // Field 0
      name: reader.read(),        // Field 1
      description: reader.read(), // Field 2
      image: reader.read(),       // Field 3
      rating: reader.read(),      // Field 4
      price: reader.read(),       // Fie ld 5
    );
  }

  @override
  void write(BinaryWriter writer, ProductData obj) {
    writer.write(obj.id);
    writer.write(obj.name);
    writer.write(obj.description);
    writer.write(obj.image);
    writer.write(obj.rating);
    writer.write(obj.price);
  }
}