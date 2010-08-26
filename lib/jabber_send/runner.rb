module JabberSend
  class Runner
    def initialize(args)
      @options = Options.new(args)
    end
    
    def run
      sender = Sender.new(@options.options[:config])
      sender.send_message(@options.options[:recipients], @options.options[:message], @options.options[:subject])
    end
  end
end