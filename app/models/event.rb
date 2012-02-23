class Event < ActiveRecord::Base
  
  ## Security
  attr_accessible :name, :speaker_id, :start_time, :end_time, :description, :as => :admin
  
  ## Associations
  belongs_to :speaker
  
  ## Scopes
  scope :next, lambda {where("start_time > ?", Time.now)}
  
end
