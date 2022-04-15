require 'rails_helper'

describe FoodsController do
  # index method
  describe 'GET #index' do
    context 'with params[:letter]' do
      it "populates an array of foods starting with the letter"
      it "renders the :index template"
    end

    context 'without params[:letter]' do
      it "populates an array of all foods"
      it "renders the :index template"
    end
  end

  # show method
  describe 'GET #show' do
    it "assigns the requested food to @food"
    it "renders the :show template"
  end
  
end