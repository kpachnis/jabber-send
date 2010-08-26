module JabberSend
  
  module Version
    MAJOR = '0'
    MINOR = '1'
    TINY  = '0'
    
    STRING = [MAJOR, MINOR, TINY].join('.')
  end
  
  APP_NAME = 'jabber-send'
  
  NAME = "#{APP_NAME} #{Version::STRING}".freeze
end