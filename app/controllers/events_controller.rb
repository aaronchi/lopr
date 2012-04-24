class EventsController < ApplicationController
  
  before_filter :authenticate_user!
  inherit_resources
  defaults :finder => :find_by_speaker!
  before_filter :check_replay, :only => :show
  
  def check_replay
    redirect_to root_path unless resource.has_replay?
  end
  
  def index
    @next_event = Event.next.first
    @event = Event.current.first || Event.last.first || Event.next.first
  end
  
end