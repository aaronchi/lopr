class Admin::EventsController < Admin::ResourcesController
  has_scope :order, :default => 'start_time'
end