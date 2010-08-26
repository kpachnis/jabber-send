require 'rubygems'
require 'xmpp4r'
require 'yaml'

module JabberSend
  class Sender
    
    include Jabber
    
    def initialize(config)
      begin
        @config = YAML.load_file(config)
      rescue Errno::ENOENT
        abort "File not found."
      rescue Errno::EACCES
        abort "Cannot open file. Permission denied!"
      end
      
      @client = Client.new(JID.new(@config['jabber']['id']))
    end
    
    def send_message(recipients, msg, subject)
      @client.connect
      
      begin
        @client.auth(@config['jabber']['password'])
      rescue ClientAuthenticationFailure
        abort "Authentication failed for #{@config['jabber']['id']}"
      end
      
      recipients.split(',').each do |recipient|
        message = Message.new(JID.new(recipient), msg).set_type(:normal).set_id('1').set_subject(subject)
        @client.send(message)
      end
      
      @client.close
    end
  end
end