require 'google/apis/calendar_v3'

class GetEvent
  
  def initialize(event_name)
    
    service = Google::Apis::CalendarV3::CalendarService.new
    service.key = 'AIzaSyDiEL4wGEJJn84x_RxroUj92XtHhbEKTFI'
    @calendar_id = 'rr5boutm86vn02o0dsrkjui4og@group.calendar.google.com'
    @event = service.list_events(@calendar_id, max_results: 100, single_events: true, order_by: 'startTime', time_min: Time.now.iso8601).items.detect { |event| event.summary.downcase.include?(event_name) }
    @start_time = Time.parse(@event.start.date_time)
    @end_time = Time.parse(@event.end.date_time)

  end

  def title
    @event.summary
  end

  def starts_on
    @start_time.strftime("%Y-%m-%d %H:%M:%S")
  end
  
  def time_left_tostart
    seconds = @start_time - Time.now
    Time.at(seconds).utc.strftime("%H:%M:%S")
  end

  def time_left_tofinish
    seconds = @end_time - Time.now
    Time.at(seconds).utc.strftime("%H:%M:%S")
  end

end
