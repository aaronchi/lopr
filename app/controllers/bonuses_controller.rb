class BonusesController < ApplicationController
  
  def show
    download = Bonus.find(params[:id]).download
    send_data open(download.asset).read, :filename => download.filename
  end
  
end