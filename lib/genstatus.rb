

require 'genstatus/fetchstatus'
require 'genstatus/getuser'
require 'genstatus/output'
require 'genstatus/jabber'

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

