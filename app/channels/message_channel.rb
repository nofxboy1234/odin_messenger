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

  def receive(data)
    puts '**** MessageChannel#receive(data) ****'

    data['user'] = current_user
    ActionCable.server.broadcast('message', data)
  end
end
