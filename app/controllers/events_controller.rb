class EventsController < ApplicationController
  
  before_filter :authenticate_user!
  inherit_resources
  defaults :finder => :find_by_speaker!
  
  def index
    @next_event = Event.next.first
    @event = Event.current.first || Event.last.first || Event.next.first
  end
  
end