require 'rubygems'
require 'net/ping'

class Job
  include HTTParty
  base_uri 'api.indeed.com'
  PER_PAGE = 10

  def initialize()
    @options = { query: {publisher: '2824545219792791', q: 'ruby', v: '2', co: 'au', l: '2000'} }
  end

  def jobs(page = 1, per_page = PER_PAGE)
    @options[:query].merge!(start: ((page - 1) * per_page), limit: per_page)
    
	begin 
	  # test tcp connection possible to google.com. rescue is triggered if unable to connect
	  # indicating no internet connection present
      TCPSocket.new 'google.com', 80 
      res = self.class.get('/ads/apisearch', @options)
      res['response']
	rescue SocketError 
	  # triggered when no internet connection present
  	  STDERR.puts "\n\nERROR: NO INTERNET CONNECTION DETECTED\n\n" 
    end 


  end

end
