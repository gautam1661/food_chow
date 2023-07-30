class ResponseClass<T> {
  bool success;
  String message;
  T? data;

  ResponseClass({
    required this.success,
    required this.message,
    this.data,
  });
}

// {
// "message": "SUCCESS",
// "data":
//  "[
//    [
//     {
//   second   \"shop_name\":\"Foodchowpizzahut\",
//            \"shop_id\":\"5066\",
//   first    \"shoplogo\":\"5066_2023-04-22_13-17-2502e592e11-99df-4f23-b20a-5e6b932c5215.jpg\",
//            \"subdomain\":\"foodchowpizzahut\",
//   fourth   \"shop_type\":\"Veg,Non-Veg\",
//            \"mobileno\":\"9023379670\",
//   sixth    \"delivery_method\":\"Take Away,Dine In,Home Delivery\",
//   third    \"cuisine\":\"Pizza\",
//   fifth    \"city\":\"Surat\",
//            \"address\":\"Vibrant Milestone\",
//            \"longitude\":\"72.83389269999999\",
//            \"latitude\":\"21.1731951\",
//            \"distance_in_km\":\"\",
//            \"cuisine_image\":\"AdminImages/2_2020-09-03_11-01-080.png\",
//            \"currency\":\"Rs.\",
//            \"offer_list\":\"[]\",
//            \"shop_status\":\"2\",
//            \"promo_code\":\"\",
//            \"total_item\":\"45\",
//            \"payment_gateway\":\"0\",
//            \"plan_purchase\":\"1\"
//     }
//   ]
// ]",
// "count": "",
// "response_code": "1"
// }
