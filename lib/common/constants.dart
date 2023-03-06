const baseUrl = "http://192.168.1.104:8000/";
const apiUrl = "${baseUrl}requests/";
const imagesUrl = "${baseUrl}media/";
const imagePlaceHolder = "image/image_placeholder.png";

final estatesTypes = ['Land', 'Farm', 'House', 'Villa', 'Store', 'Office', 'Building', 'Apartment'];

enum RealEstateType { all, land, farm, house, villa, store, office, building, apartment }

enum Operation { all, sell, rent }

const token = "bccea46620d3dd1d238b0d45f9cd39e2cb607b22";
