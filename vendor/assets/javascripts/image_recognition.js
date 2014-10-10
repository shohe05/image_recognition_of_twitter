/*
  args: an url of image on web.
  return: the results(tags) of image-recognition by the api of clarifai.
*/
function recognize_image(image_url) {
  var tags = [];
  $.ajax({
    'url': "https://sender.blockspring.com/api_v1/blocks/1751dda528c435200664e90be095bd04?api_key=bd5d51048dda177a9f68855fc0e510ef",
    'type': "POST",
    'async': false,
    'data': { 'image_url': image_url },
    'crossDomain': true
  }).done(function(response){
    tags = response.results;
    // console.log(results); // デバッグ
  });
  return tags;
}
