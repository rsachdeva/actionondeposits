class DepositsController < ApplicationController

  def index
    @deposits = Deposit.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @deposits }
    end
  end
end
