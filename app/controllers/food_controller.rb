class FoodController < ApplicationController
  def index
    @foods = params[:letter].nil? ? Food.all : Food.by_letter(params[:letter])
  end

  def create
  end

  def new
  end

  def destroy
  end

  def show
  end

  def update
  end
end
