class Event < ActiveRecord::Base
  
  ## Security
  attr_accessible :name, :speaker_id, :event_id, :ia_id, :start_time, :end_time, :description, :audio_download_attributes, :transcript_download_attributes, :as => :admin
  
  ## Associations
  belongs_to :speaker
  has_one :audio_download, :as => :downloadable, :class_name => 'Download', :conditions => {:download_type_cd => 1}
    accepts_nested_attributes_for :audio_download, :reject_if => proc { |a| a["remote_asset_url"].blank? }
  has_one :transcript_download, :as => :downloadable, :class_name => 'Download', :conditions => {:download_type_cd => 2}
    accepts_nested_attributes_for :transcript_download, :reject_if => proc { |a| a["remote_asset_url"].blank? }
  
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
    !audio_download.nil?
  end
  
  def has_transcript?
    !transcript_download.nil?
  end
  
  def timecode
    t = start_time - Time.now
    mm, ss = t.divmod(60)
    hh, mm = mm.divmod(60)
    dd, hh = hh.divmod(24)
    return format("%02d:%02d:%02d:%02d", dd, hh, mm, ss)
  end
  
end
