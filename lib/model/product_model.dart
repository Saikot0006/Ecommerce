
final String PRODUCT_ID = 'id';
final String PRODUCT_NAME = 'name';
final String PRODUCT_PRICE = 'price';
final String PRODUCT_DESCRIPTION = 'description';
final String PRODUCT_CATEGORY = 'category';
final String PRODUCT_RATING = 'rating';
final String PRODUCT_LOCAL_IMAGE = 'localImage';
final String PRODUCT_IMAGE_URL = 'imageUrl';
final String PURCHASE_FORMATTED_DATE = 'purchaseFormattedDate';
final String PURCHASE_TIMESTAMP = 'purchaseTimeStamp';

class ProductModel {
  String id;
  String name;
  num price;
  String description;
  String category;
  num rating;
  String localImage;
  String imageUrl;
  String purchaseFormattedDate;
  int purchaseTimeStamp;

  ProductModel(
      {this.id,
      this.name,
      this.price = 0,
      this.description,
      this.category,
      this.rating = 0,
      this.localImage,
      this.imageUrl,
      this.purchaseFormattedDate,
      this.purchaseTimeStamp});

  ProductModel.fromMap(Map<String,dynamic> map){
    id = map[PRODUCT_ID];
    name = map[PRODUCT_NAME];
    price = map[PRODUCT_PRICE];
    description = map[PRODUCT_DESCRIPTION];
    category = map[PRODUCT_CATEGORY];
    rating = map[PRODUCT_RATING];
    localImage = map[PRODUCT_LOCAL_IMAGE];
    imageUrl = map[PRODUCT_IMAGE_URL];
    purchaseFormattedDate = map[PURCHASE_FORMATTED_DATE];
    purchaseTimeStamp = map[PURCHASE_TIMESTAMP];
  }



  Map<String,dynamic> toMap(){
    var map = <String,dynamic> {

      PRODUCT_ID : id,
      PRODUCT_NAME : name,
      PRODUCT_PRICE : price,
      PRODUCT_DESCRIPTION : description,
      PRODUCT_CATEGORY : category,
      PRODUCT_RATING : rating,
      PRODUCT_LOCAL_IMAGE : localImage,
      PRODUCT_IMAGE_URL : imageUrl,
      PURCHASE_FORMATTED_DATE : purchaseFormattedDate,
      PURCHASE_TIMESTAMP : purchaseTimeStamp,

    };
    return map;
  }



  @override
  String toString() {
    return 'ProductModel{id: $id, name: $name, price: $price, description: $description, category: $category, rating: $rating, localImage: $localImage, imageUrl: $imageUrl, purchaseFormattedDate: $purchaseFormattedDate, purchaseTimeStamp: $purchaseTimeStamp}';
  }
}

