class Department < ActiveRecord::Base
  has_many :shelves, dependent: :destroy

  has_many :products, through: :shelves

end
