class Event < ActiveRecord::Base
  attr_accessible :text, :start_date, :end_date, :event_pid, :event_length, :rec_pattern, :rec_type
end
