require 'rails_helper'


RSpec.describe WikisController, type: :controller do
let(:my_wiki) { wiki.create!(title: RandomData.random_sentence, body: RandomData.random_paragraph) }
  describe "GET index" do
    it "returns http success" do

      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET new" do
      it "returns http success" do
        get :new
        expect(response).to have_http_status(:success)
      end

 # #2
      it "renders the #new view" do
        get :new
        expect(response).to render_template :new
      end

 # #3
      it "instantiates @wiki" do
        get :new
        expect(assigns(:wiki)).not_to be_nil
      end
    end

    describe "wiki create" do
 # #4
      it "increases the number of wiki by 1" do
        expect{wiki :create, wiki: {title: RandomData.random_sentence, body: RandomData.random_paragraph}}.to change(wiki,:count).by(1)
      end

 # #5
      it "assigns the new wiki to @wiki" do
        wiki :create, wiki: {title: RandomData.random_sentence, body: RandomData.random_paragraph}
        expect(assigns(:wiki)).to eq wiki.last
      end

 # #6
      it "redirects to the new wiki" do
        wiki :create, wiki: {title: RandomData.random_sentence, body: RandomData.random_paragraph}
        expect(response).to redirect_to wiki.last
      end
    end

    describe "GET show" do
     it "returns http success" do
 # #16
       get :show, {id: my_wiki.id}
       expect(response).to have_http_status(:success)
     end
     it "renders the #show view" do
 # #17
       get :show, {id: my_wiki.id}
       expect(response).to render_template :show
     end

     it "assigns my_wiki to @wiki" do
       get :show, {id: my_wiki.id}
 # #18
       expect(assigns(:wiki)).to eq(my_wiki)
     end
   end
end 
