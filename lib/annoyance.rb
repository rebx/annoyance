

require 'annoyance/fetchstatus'
require 'annoyance/getuser'
require 'annoyance/output'
require 'annoyance/jabber'

class GenStatus
  
  include GetUser
  include FetchStatus
  include JabberUtils
  include OutputUtils
  
  def initialize(username=nil, gender='M')
    @username = username
    @gender = gender
  end
  
end

