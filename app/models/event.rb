class Event < ActiveRecord::Base
  belongs_to :parent, :class_name => 'Event', :primary_key => 'id', :foreign_key => 'event_pid'
  has_many :children, :class_name => 'Event', :foreign_key => 'event_pid', :dependent => :destroy
  attr_accessible :text, :start_date, :end_date, :event_pid, :event_length, :rec_pattern, :rec_type
end
