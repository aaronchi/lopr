class EventsController < ApplicationController
  
  inherit_resources
  
  def index
    @next_event = Event.next.first
  end
  
end