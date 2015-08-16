class Api::ConsolesController < ApplicationController
  def show
    @console = Console.find(params[:id])
  end
end
