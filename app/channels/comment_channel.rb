class CommentChannel < ApplicationCable::Channel
  def subscribed
    @product = Product.find(params[:product_id]) # 追記
    stream_for @product # 追記
    # stream_from "comment_channel" #削除
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
