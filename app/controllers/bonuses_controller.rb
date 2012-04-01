class BonusesController < ApplicationController
  
  def show
    bonus = Bonus.find(params[:id]) 
    uploader = bonus.asset 
    uploader.retrieve_from_store!(File.basename(bonus.asset.url))
    uploader.cache_stored_file!
    send_file uploader.file.path
  end
  
end