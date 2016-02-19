# == Schema Information
#
# Table name: products
#
#  id          :integer          not null, primary key
#  name        :string
#  description :string
#  price       :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class ProductsController < ApplicationController
  before_action :find_product, only: [:show, :update, :edit, :destroy]


  def new
    @product = Product.new
  end

  def create
    # params => {"question"=>{"title"=>"hello world", "body"=>"something here"}}
  #  question       = Question.new
  #  question.title = params[:question][:title]
  #  question.body  = params[:question][:body]

  # using params. require ensures that there is a key called 'question' in my
  # params. the 'permit' method will only allow paramsters that you explicitly
  # list, in this case: title and body
   @product = Product.new product_params
   # When you .save it will return 'save' or 'false'
   if @product.save
   redirect_to(product_path(@product), {notice: "Question Created Successfully!"})
   else
   # This will render app/views/questions/new.html.erb template
   # we need to be explict about rendering the new template because the
   # default behavior is to render 'create.html.erb'
   # you can specify full path such as: render "/questions/new"
   flash[:alert] = "Question wasn't created. Check errors below"
   render :new
  end
end

 def show
    @review = Review.new
 end

 def index
   @products = Product.all
                      #.order("price ASC")
 end

 def edit
   # this will find the question that we will need to add
 end

 def update
   if @product.update product_params
     redirect_to(product_path(@product), {notice: "product updated"})
   else
     render :edit
   end
 end


 def destroy
   @product.destroy
 redirect_to(products_path, {notice: "product deleted" })
 end

 private

 def product_params
   params.require(:product).permit([:name, :description, :price, {department_ids:[]}])
 end

 def find_product
   @product = Product.find params[:id]

 end

 def authorize_user
   unless can? :manage, @product
     redirect_to root_path, alert: "access denied!"
   end

 end

end
