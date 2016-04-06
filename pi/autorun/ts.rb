require "net/http" 
require "uri" 
require 'json'
load 'createCH.rb'

    userkey = 'O8ZGSB6CPI3OBODH'
    thingspeak = 'http://www.tsiots.com:3000/'
    
    Struct.new("Device", :id, :address ,:existence ,:name, :api_key)
    ary = Array.new 
    
    uri = URI(thingspeak + '/channels.json')
    params = { 'api_key' => userkey}
    uri.query = URI.encode_www_form(params)
    res = Net::HTTP.get_response(uri)
    #puts res.body
    
    
    str = JSON.parse( res.body)

   # open('channel.txt', 'w') { |f|
    
    str.each do |s|
       str2 =s['metadata']
       
        #f.puts s['id'].to_s + " " + str2
        ary.push( Struct::Device.new(s['id'], str2, false ,s['name'],s['api_keys'][0]['api_key']))
    end
    #}


    
    f = File.open("ble_devicelist.txt", "r")
    f.each_line do |line|
        
        
        
                    line =   line.tr("\n", '')
                
                    repeat = false
                    ary.each do |d|
                            
                            if line.include? d[:address]
                                
                               d[:existence] = true
                               update_channel(thingspeak,d[:id],userkey)
                               repeat = true
                            end
                    end
                    
                    
                    if repeat == false
                            # create a channel
                         channel = create_channel(thingspeak+"/channels",userkey,line) 
                         ary.push( Struct::Device.new(channel['id'], channel['mac'], true ,channel['name'],channel['api_key']))
                    end
                    
                    
                
 
    end
    f.close
    
    
    
    
    open('ble_params.txt', 'w') { |fp|
    
        ary.each do |a|
        
        
            if a[:existence] == true
                fp.puts  "-b  " + a[:address]  + " -t random " + "-I " + a[:id].to_s  + " " + a[:api_key] + " " + thingspeak + " " + a[:name]
            end
        end
    }
    
   
    
    # cat /sys/class/net/eth0/address
   
#delete_all_channel(thingspeak,userkey)