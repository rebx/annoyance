
require 'etc'

module GetUser
  
  PRIMARY_DOMAIN = 'wetafx.co.nz'

  def getuser
    @username = get_name
    @name = get_user_name
  end

  def get_user_name
    return Etc.getpwuid(Process.uid()).name
  end

  def get_name
    return Etc.getpwuid(Process.uid).gecos.split(pattern=" ", 0)[0]
  end

  def gender(gen='M')
    return self.gender=(gen) 
  end
  
  def gender=(gen='M')
    return gen =~ /^M/i ? 'M' : 'F'
  end
end
