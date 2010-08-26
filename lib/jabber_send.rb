module JabberSend
  ROOT = File.expand_path(File.dirname(__FILE__))
  
  autoload :Options,  "#{ROOT}/jabber_send/options"
  autoload :Runner,   "#{ROOT}/jabber_send/runner"
  autoload :Sender,   "#{ROOT}/jabber_send/sender"
  
  require "#{JabberSend::ROOT}/jabber_send/version"
end