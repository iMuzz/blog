class ReadController < ApplicationController

  def create
    @read = Read.includes(:book).find_by(id: params[:id])
  end

end
