require 'optparse'

module JabberSend
  class Options
    
    CONFIG = '/etc/jabber-send/conf.yaml'.freeze
    
    attr_accessor :options
    
    def initialize(args)
      @options = {
        :config => CONFIG,
        :message => "",
        :recipients => "",
        :subject => ""
      }
      
      parse(args)
    end
    
    private
      def parse(args)
        OptionParser.new do |opts|
          opts.banner = "Usage: jabber-send [options]"
          
          opts.on("-c", "--config [FILE]", String, "Configuration file") do |conf|
            @options[:config] = conf
          end
          
          opts.on("-m", "--message [TEXT]", "Message to send") do |msg|
            @options[:message] = msg
          end
          
          opts.on("-r", "--recipient [NAME]", "Comma separated list of receipients") do |recipients|
            @options[:recipients] = recipients
          end
          
          opts.on("-s", "--subject [TEXT]", "Subject") do |subject|
            @options[:subject] = subject
          end
          
          opts.on("-v", "--version", "Show Version") do
            puts JabberSend::NAME
          end
          
          opts.on("-h", "--help", "Show this message") do
            puts opts
            exit
          end
          
          begin
            args = ["-h"] if args.size != 8
            opts.parse!(args)
          rescue OptionParser::ParseError => e
            STDERR.puts e.message, "\n", opts
            abort
          end
          
        end
      end
  end
end