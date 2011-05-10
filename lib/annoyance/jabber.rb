
require 'eventmachine'
require 'blather/client'
require_relative 'fetchstatus'

module JabberUtils
  
  JABBER_HOST = 'jabber.' + GetUser::PRIMARY_DOMAIN
  
  def runchatbot(username=@username)
    set_chat_auth(username)
    trap(:INT) { EventMachine.stop }
    EM.run {
      pcl = setup(@chat_id, @chat_pass, JABBER_HOST)
      unless pcl.connect
        message :chat? do |m|
          say m.from, self.getstatus!
        end
      end
    }
  end
  
  def set_chat_auth(username)
    chatuser=(username)   
    @chat_id = Blather::JID.new(@chat_user)
  end
  
  def chatuser=(username=@username)
    @chat_user = username + '@' + JABBER_HOST
  end
  
  def chat_pass=(pass)
    @chat_pass = pass
  end
  
end
