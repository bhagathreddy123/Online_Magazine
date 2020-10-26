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
    @event = Event.new
    if params[:event][:numgsts].blank?
      params[:event][:numgsts]=0
    end

    @event.attributes = params[:event]

    if @event.save
      # if end is blank, set to end of day
      if @event.when_its_over.blank?
        @event.when_its_over=@event.when.end_of_day
        @event.save
      end
      @event.after_save
      redirect_to events_url
    else
      flash[:notice]="Event was incorrect."
      redirect_to new_event_url
    end
  end
end
