class ImagesController < ApplicationController
  def index
  end

  def create
    @image = Image.new(url: params[:url], tweet_url: params[:tweet_url], posted_at: params[:posted_at])
    @tags = params[:tags]
    # logger.debug(@image.inspect);
    logger.debug('=' * 50);
    logger.debug(@tags.inspect);
    if @image.save
      logger.debug('saved')
      logger.debug(params[:tweet].inspect)
      @tags.each do |tag|
        @tag = Tag.new(name: tag)
        @tag.save
        ImagesTag.create(image_id: Image.find_by(url: @image.url).id, tag_id: Tag.find_by(name: tag).id)
      end
      render json: { status: 'success'}
    else
      logger.debug('faild')
      render json: { status: 'faild'}
    end
  end

  def search_by_tag
    results = []
    Image.all.each do |image|
      tags = image.tags.map(&:name)
      results << {image: image, matches: tags & params[:tags] } if (tags & params[:tags]).size > 3
    end
    render json: { results: results.sort_by { |result| result[:matches].size }.reverse!, id: params[:id] }
  end
end
