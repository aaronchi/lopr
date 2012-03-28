class Event < ActiveRecord::Base
  
  ## Security
  attr_accessible :name, :speaker_id, :event_id, :ia_id, :start_time, :end_time, :description, :as => :admin
  
  ## Associations
  belongs_to :speaker
  
  ## Scopes
  scope :next, lambda {where("end_time > ?", Time.now)}
  
  ## Scopes
  default_scope :order => 'start_time'
  
  def timecode
    t = start_time - Time.now
    mm, ss = t.divmod(60)
    hh, mm = mm.divmod(60)
    dd, hh = hh.divmod(24)
    return format("%02d:%02d:%02d:%02d", dd, hh, mm, ss)
  end
  
end
