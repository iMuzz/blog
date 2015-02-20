class ReadController < ApplicationController

  def show
    @read = Read.includes(:book).find_by(id: params[:id])
  end

end
