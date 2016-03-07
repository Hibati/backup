require "net/http" 
require "uri" 
require 'json'
    actuator = 0
    sensor = 1
    usekey = 'ML96T5X7IBRSY4IY'
    thingspeak = 'http://www.tsiots.com:3000/channels'
    
    uri = URI(thingspeak + '.json')
    params = { 'api_key' => usekey}
    uri.query = URI.encode_www_form(params)
    res = Net::HTTP.get_response(uri)
   
    puts res.body
    str = JSON.parse( res.body)
    
    
    
    open('myfile.txt', 'w') { |f|
    
    str.each do |s|
       #str2 = JSON.parse(s['metadata'])
       
        f.puts s['id']
    end
}
