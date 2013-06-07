class EventsController < ApplicationController
  protect_from_forgery :except => :dbaction
  expose(:events){ Event.all }
  expose(:event){
    if mode == 'inserted'
      Event.new(options)
    elsif params[:id]
      Event.find(params[:id])
    elsif params[:event][:id]
      Event.find(params[:event][:id])
    else
      Event.new(options)
    end
  }
  expose(:options){
    options = {
      :text => params[:text],
      :start_date => params[:start_date].to_time().strftime('%Y-%m-%d %H:%M:%S %Z'),
      :end_date => params[:end_date].to_time().strftime('%Y-%m-%d %H:%M:%S %Z'),
      :event_pid => params[:event_pid].to_i,
      :event_length => params[:event_length],
      :rec_pattern => params[:rec_pattern],
      :rec_type => params[:rec_type]
    }
  }
  expose(:mode){
    @mode = params["!nativeeditor_status"]
  }
  def index
    respond_to do |format|
      format.xml {render :layout => false}
      format.json {render :layout => false}
    end
  end

  def save
    @id = params["id"]
    @tid = @id
    if mode == "inserted"
      event = Event.new(options)
      event.save!
      @tid = event.id
    elsif mode == "deleted"
      event=Event.find(@id)
      event.destroy
    elsif mode == "updated"
      event=Event.find(@id)
      event.update_attributes(options)
    end
    request.format = "xml"
    respond_to do |format|
      format.xml {render :layout => false}
    end
  end
end
