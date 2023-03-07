const baseUrl = "http://172.16.60.66:8000/";
const apiUrl = "${baseUrl}requests/";
const imagesUrl = "${baseUrl}media/";
const imagePlaceHolder = "image/image_placeholder.png";

final estatesTypes = ['Land', 'Farm', 'House', 'Villa', 'Store', 'Office', 'Building', 'Apartment'];

enum RealEstateType { all, land, farm, house, villa, store, office, building, apartment }

enum Operation { all, sell, rent }
