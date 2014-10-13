function Twitter() {}

Twitter.prototype = {
        consumerKey:    "mnQkkInkvC10fShxUoCu4pdfq",
        consumerSecret: "mv6i9EyUMutAty31TQdhV2LLK8JmJL6zHC9aFhwHXIjri1Zn2D",
        accessToken:    "142711298-QLw0T0aBYSpqx54bHvJgkxeVZaJXzJgurrGCI8hB",
        tokenSecret:    "DNnSmBguT8KcgoWCG5TH7l6JmYaCTYVXsij94TGbqazYo"
};

Twitter.prototype.get = function(api, content) {
    var accessor = {
        consumerSecret: this.consumerSecret,
        tokenSecret: this.tokenSecret
    };

    var message = {
        method: "GET",
        action: api,
        parameters: {
            oauth_version: "1.0",
            oauth_signature_method: "HMAC-SHA1",
            oauth_consumer_key: this.consumerKey,
            oauth_token: this.accessToken
        }
    };
    for (var key in content) {
        message.parameters[key] = content[key];
    }
    OAuth.setTimestampAndNonce(message);
    OAuth.SignatureMethod.sign(message, accessor);
    var target = OAuth.addToURL(message.action, message.parameters);
    var tweets = new Array();
    $.ajax({
      'type': message.method,
      'url': target,
      'dataType': "jsonp",
      'jsonp': false,
      'cache': true,
      // 'async': false
    });
}

function update(data) {
    $(window).trigger('finishGettingImages', data);
    for( var i = 0; i < data.statuses.length; i++ ) {
      if (data.statuses[i].entities.media) {
        $("#test").append("<a href='" + data.statuses[i].entities.media[0].expanded_url + "'>" + "<img src='" + data.statuses[i].entities.media[0].media_url + "' width='300' height='300'></a>");
        // console.log(data.statuses[i].entities.media[0].media_url);
        // console.log(i);
      }
    }
}

function getTweets(tweets) {
  return tweets;
}
