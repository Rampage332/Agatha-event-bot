class Timeline
   attr_accessor :day, :time, :event_name

   def initialize(opts)
      @day = opts[:day]
      @time = opts[:time]
      @event_name = opts[:event_name]
   end
end


