require 'google/apis/calendar_v3'

class GetEvent
  def initialize(event_name)
    @event_name = event_name
    @calendar = Google::Apis::CalendarV3::CalendarService.new
    @calendar.key = 'AIzaSyDiEL4wGEJJn84x_RxroUj92XtHhbEKTFI'
    @calendar_id = 'rr5boutm86vn02o0dsrkjui4og@group.calendar.google.com'
    @event = fetch_event
  end



  def fetch_event
    events = @calendar.list_events(
        @calendar_id,
        max_results: 100,
        single_events: true,
        order_by: 'startTime',
        time_min: Time.now.iso8601
        )

    events.items.each do |event|
      puts "Summary: #{event.summary}"
      puts "Description: #{event.description}"
      puts "Start Time: #{event.start.date_time}"
      puts "End Time: #{event.end.date_time}"
      puts "-------------------------"
    end

    events.items.find { |event| event.summary.downcase.include?(@event_name.downcase) }
  
  end

end
