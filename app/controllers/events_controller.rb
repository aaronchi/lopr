class EventsController < ApplicationController
  
  before_filter :authenticate_user!
  inherit_resources
  
  def index
    @next_event = Event.next.first
    @event = Event.current.first || Event.last.first || Event.next.first
  end
  
end