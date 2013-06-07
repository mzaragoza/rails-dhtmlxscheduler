json.array!(events) do |json, event|
  json.id event.id
  json.text event.text
  json.start_date event.start_date.strftime('%Y-%m-%d %H:%M')
  json.end_date event.end_date.strftime('%Y-%m-%d %H:%M')
  json.event_pid event.event_pid
  json.event_length event.event_length
  json.rec_pattern event.rec_pattern
  json.rec_type event.rec_type
end
