require 'rails_helper'

RSpec.describe "Wines", type: :request do
  describe "GET /index" do
    describe "GET index" do
      it "returns a successful response" do
        get :index
        expect(response).to be_successful
      end
     
      it "assigns @wines" do
        wine = Wine.create(name: "Prueba Uno", score: 9)
        get :index
        expect(assigns(:wines)).to eq([wine])
      end

      it "renders the index template" do
        get :index
        expect(response).to render_template("index")
      end
    end
  end
end
