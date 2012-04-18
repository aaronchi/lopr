class Event < ActiveRecord::Base
  
  ## Security
  attr_accessible :name, :speaker_id, :event_id, :ia_id, :start_time, :end_time, :description, :as => :admin
  
  ## Associations
  belongs_to :speaker
  
  ## Validations
  validates_datetime :end_time, :after => :start_time
  
  ## Scopes
  scope :last, lambda {where("end_time < ?", Time.now).order('start_time desc')}
  scope :next, lambda {where("start_time > ?", Time.now).order('start_time')}
  scope :current, lambda {where("start_time <= ? AND end_time > ?", Time.now, Time.now)}
  
  ## Scopes
  #default_scope :order => 'start_time'
  
  def over?
    Time.now.utc > end_time
  end
  
  def has_audio?
    false
  end
  
  def has_transcript?
    false
  end
  
  def timecode
    t = start_time - Time.now
    mm, ss = t.divmod(60)
    hh, mm = mm.divmod(60)
    dd, hh = hh.divmod(24)
    return format("%02d:%02d:%02d:%02d", dd, hh, mm, ss)
  end
  
end
