class MessageChannel < ApplicationCable::Channel
  def subscribed
    puts '**** MessageChannel#subscribed ****'

    # stream_from "some_channel"
    stream_from 'message'
  end

  def unsubscribed
    puts '**** MessageChannel#unsubscribed ****'
    
    # Any cleanup needed when channel is unsubscribed
  end
end
