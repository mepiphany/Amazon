class Shelf < ActiveRecord::Base
  belongs_to :product
  belongs_to :department

  # validate_associated :department, :product
  validates :product_id, uniqueness: { scope: :department_id }
end
