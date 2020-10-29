class EventsController < ApplicationController
  def index
    @events = Array.new

    if !params[:sort].blank?
      order = "#{params[:sort]} #{(params[:asc].blank? || params[:asc] == 'true') ? 'DESC' : 'ASC'}"
      Event.order(order).all.each do |event|
        @events << event
      end
    else
      order = "starts_at #{(params[:asc].blank? || params[:asc] == 'true') ? 'DESC' : 'ASC'}"
      @events = Event.order(order).all
    end
  end

  def new
    @event = Event.new
    # so the view shows 0 and not blank
    @event.numgsts = 0
  end

  def create
    @event = Event.new(event_params)
    if @event.save
       redirect_to events_url
    else
      flash[:notice]="Event was incorrect."
      redirect_to new_event_url
    end
  end

  private

  def event_params
    params.require(:event).permit!
  end
end
