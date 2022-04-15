require 'rails_helper'

describe FoodsController do
  # index method
  describe 'GET #index' do
    context 'with params[:letter]' do
      it "populates an array of foods starting with the letter" do
        nasi_uduk = create(:food, name: "Nasi Uduk")
        kerak_telor = create(:food, name: "Kelar Telor")
        get :index, params: { letter: 'N' }
        expect(assigns(:foods)).to match_array([nasi_uduk])
      end

      it "renders the :index template" do
        get :index, params: { letter: 'N' }
        expect(response).to render_template :index
      end
    end

    context 'without params[:letter]' do
      it "populates an array of all foods" do 
        nasi_uduk = create(:food, name: "Nasi Uduk")
        kerak_telor = create(:food, name: "Kelar Telor")
        get :index
        expect(assigns(:foods)).to match_array([nasi_uduk, kerak_telor])
      end

      it "renders the :index template" do
        get :index
        expect(response).to render_template :index
      end
    end
  end

  # show method
  describe 'GET #show' do
    it "assigns the requested food to @food" do
      food = create(:food)
      get :show, params: { id: food }
      expect(assigns(:food)).to eq food
    end

    it "renders the :show template" do
      food = create(:food)
      get :show, params: { id: food }
      expect(response).to render_template :show
    end
  end

  # new method
  describe 'GET #new' do
    it "assigns a new Food to @food" do
      get :new
      expect(assigns(:food)).to be_a_new(Food)
    end

    it "renders the :new template" do
      get :new
      expect(:response).to render_template :new
    end
  end

  # edit method
  describe 'GET #edit' do
    it "assigns the requested food to @food" do
      food = create(:food)
      get :edit, params: { id: food }
      expect(assigns(:food)).to eq food
    end

    it "renders the :edit template" do
      food = create(:food)
      get :edit, params: { id: food }
      expect(response).to render_template :edit
    end
  end

  # create method and testing POST request
  describe 'POST #create' do
    context "with valid attributes" do
      it "saves the new food in the database" do
        expect{
          post :create, params: { food: attributes_for(:food) }
        }.to change(Food, :count).by(1)
      end

      it "redirects to foods#show" do
        post :create, params: { food: attributes_for(:food) }
        expect(response).to redirect_to(food_path(assigns[:food]))
      end
    end

    # create method with invalid food attributes
    context "with invalid attributes" do
      it "does not save the new food in the database" do
        expect{
          post :create, params: { food: attributes_for(:invalid_food) }
        }.not_to change(Food, :count)
      end

      it "re-renders the :new template" do
        post :create, params: { food: attributes_for(:invalid_food) }
        expect(response).to render_template :new
      end
    end
  end

  # update method and Testing PATCH Requests
  describe 'PATCH #update' do
    before :each do
      @food = create(:food)
    end

    context "with valid attributes" do
      it "locates the requested @food" do
        patch :update, params: { id: @food, food: attributes_for(:food) }
        expect(assigns(:food)).to eq @food
      end

      it "changes @food's attributes" do
        patch :update, params: { id: @food, food: attributes_for(:food, name: 'Nasi Uduk') }
        @food.reload
        expect(@food.name).to eq('Nasi Uduk')
      end

      it "redirects to the food" do
        patch :update, params: { id: @food, food: attributes_for(:food) }
        expect(response).to redirect_to @food
      end
    end

    # PATCH requests, with invalid attributes
    context 'with invalid attributes' do
      it 'does not save the updated food in the database' do
        patch :update, params: { id: @food, food: attributes_for(:invalid_food, name: 'Nasi Uduk', price: "Test") }
        expect(@food.name).not_to eq('Nasi Uduk')
      end

      it 're-renders the edit template' do
        patch :update, params: { id: @food, food: attributes_for(:invalid_food) }
        expect(assigns(:food)).to eq @food
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  # destroy method
  describe 'DELETE #destroy' do
    it "deletes the food from the database"
    it "redirects to foods#index"
  end
  
end