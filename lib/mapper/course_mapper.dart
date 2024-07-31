import 'package:cose_front/model/place.dart';
import '../dto/place_response_dto.dart';


PlaceResponseDto placeToPlaceResponseDto(Place place) {
    return PlaceResponseDto(
        id: place.id,
        name: place.name,
        url: place.url,
        category: place.category,
        address: place.address,
        longitude: place.longitude,
        latitude: place.latitude,
        placeOrder: place.placeOrder,
        content: '');
}
