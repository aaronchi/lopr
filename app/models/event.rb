class Event < ActiveRecord::Base
  
  ## Security
  attr_accessible :name, :speaker_id, :event_id, :ia_id, :start_time, :end_time, :description, :as => :admin
  
  ## Associations
  belongs_to :speaker
  
  ## Scopes
  scope :next, lambda {where("end_time > ?", Time.now)}
  
  ## Scopes
  default_scope :order => 'start_time'
  
end
