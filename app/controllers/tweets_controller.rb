class TweetsController < ApplicationController
  def index
    if @current_user.present?
      # @tweets = twitter_client.user_timeline
      logger.debug(twitter_client.methods.inspect)
    end
  end

  def twitter_client
    Twitter::Client.new(
      :access_token => @current_user.token,
      :access_token_secret => @current_user.secret
    )
  end
end
