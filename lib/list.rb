module LoggerParser
  class List
  
    def initialize(args = {})
      @path ||= args[:path]
      @visitor_id ||= args[:visitor_id]
    end

  end
end