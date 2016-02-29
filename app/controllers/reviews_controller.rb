# == Schema Information
#
# Table name: reviews
#
#  id         :integer          not null, primary key
#  body       :text
#  product_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class ReviewsController < ApplicationController
  def create
    @product = Product.find params[:product_id]
    review_params = params.require(:review).permit(:body)
    @review = Review.new(review_params)
    @review.product = @product
    respond_to do |format|
    if @review.save
      format.html { redirect_to product_path(@product), notice: "Review created!" }
      format.js { render :create_success }
    else
      format.html{ render "/products/show" }
      format.js { render :create_failure }
    end
   end
  end

  def destroy
    @review = Review.find params[:id]
    @review.destroy
    respond_to do |format|
    format.html {redirect_to product_path(params[:product_id]), notice: "Review deleted"}
    format.js { render }
  end
 end
end
