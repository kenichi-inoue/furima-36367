class CommentChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    stream_from "comment_channel" #追加
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
