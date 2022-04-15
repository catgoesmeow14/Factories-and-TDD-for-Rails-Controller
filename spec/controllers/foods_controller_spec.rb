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

  # new method
  describe 'GET #new' do
    it "assigns a new Food to @food"
    it "renders the :new template"
  end

  # edit method
  describe 'GET #edit' do
    it "assigns the requested food to @food"
    it "renders the :edit template"
  end

  # create method
  describe 'POST #create' do
    context "with valid attributes" do
      it "saves the new food in the database"
      it "redirects to foods#show"
    end

    context "with invalid attributes" do
      it "does not save the new food in the database"
      it "re-renders the :new template"
    end
  end

  # update method
  describe 'PATCH #update' do
    context "with valid attributes" do
      it "locates the requested @food"
      it "changes @food's attributes"
      it "redirects to the food"
    end

    context "with invalid attributes" do
      it "does not update the food in the database"
      it "re-renders the :edit template"
    end
  end

  # destroy method
  describe 'DELETE #destroy' do
    it "deletes the food from the database"
    it "redirects to foods#index"
  end
  
end