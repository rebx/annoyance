
require 'nokogiri'
require 'open-uri'
require_relative 'getuser'

module FetchStatus

  
  GENERATUS_URI = "http://www.generatus.com/AJAXStatus.asp?"
 
  def genuri(name=@username, gender='M')
    #return genstat = "http://www.generatus.com/AJAXStatus.asp?G=M&N=" + self.get_user_name
    return GENERATUS_URI + 'G=' + self.gender + '&N=' + self.get_name
  end

  def getstatus!
    doc = Nokogiri::HTML(open(self.genuri))
    doc.encoding = 'utf-8'
    return doc.text.split(pattern="#",0)[0]
  end

  
  
end
