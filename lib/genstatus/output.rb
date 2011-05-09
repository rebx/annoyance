
require 'eventmachine'
require_relative 'fetchstatus'
#require 'fetchstatus'

module OutputUtils
  
  def output!
    puts self.getstatus!
  end
  
  def infinite_output!(interval=1)
    EM.run {
      EventMachine::PeriodicTimer.new(interval) do
        puts self.getstatus!
      end
    }
  end
  
  def write_to_file(filename=nil, prefix='# ')
    unless filename.nil?
      File.open(filename, 'a+') {|f| f.write(prefix + self.getstatus! + "\n") }
    end
  end
  
end
