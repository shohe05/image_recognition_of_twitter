class TagsController < ApplicationController
  def create
    @tag = Tag.new(name: params[:name])
    logger.debug(@tag.inspect);
    if @tag.save
      @images_tag = ImagesTag.new(image_id: Image.find_by(url: params[:image_url]).id, tag_id: Tag.find_by(name: params[:name]).id)
      if @images_tag.save
        logger.debug('saved')
        render json: { status: 'success'}
      else
        logger.debug('tag_image faild')
        render json: { status: 'tag_image faild'}
      end
    else
      logger.debug('faild')
      render json: { status: 'faild'}
    end
  end
end
