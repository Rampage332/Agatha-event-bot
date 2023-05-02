require 'google/apis/calendar_v3'

class GetEvent
  def initialize(event_name)
    @event_name = event_name
    @calendar = Google::Apis::CalendarV3::CalendarService.new
    @calendar.key = 'AIzaSyDiEL4wGEJJn84x_RxroUj92XtHhbEKTFI'
    @calendar_id = 'rr5boutm86vn02o0dsrkjui4og@group.calendar.google.com'
    @event = fetch_event
  end

  def thumbnail
    return @thumbnail if @thumbnail

    desc_lines = @event.description.split("\n")
    thumbnail_line = desc_lines[1]
    if thumbnail_line.nil?
      @thumbnail = "https://i.imgur.com/FrnqoHa.jpg"
    else
      @thumbnail = thumbnail_line.split('"')[1]
    end
  end

  def title
    @event.summary
  end

  def description
    @event.description.lines[3..].join.strip
  end

  def starts_on
    @event.start.date_time.strftime('%a, %d %b %Y %H:%M:%S %z')
  end

  def time_left_tostart
    now = Time.now.utc
    start_time = @event.start.date_time
    return "Event has already started." if start_time <= now

    time_left = start_time - now
    Time.at(time_left).utc.strftime("%H:%M:%S")
  end

  def time_left_tofinish
    now = Time.now.utc
    end_time = @event.end.date_time
    return "Event has already ended." if end_time <= now

    time_left = end_time - now
    Time.at(time_left).utc.strftime("%H:%M:%S")
  end

  private

  def fetch_event
    events = @calendar.list_events(@calendar_id, max_results: 40, single_events: true, order_by: 'startTime', time_min: Time.now.iso8601)
    events.items.find { |event| event.summary.downcase == @event_name.downcase }
  end
end
