class BonusesController < ApplicationController
  
  def show
    bonus = Bonus.find(params[:id]) 
    send_data(open(bonus.url), :filename => bonus.filename, :x_sendfile => true)
  end
  
end