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

class Product < ActiveRecord::Base
  has_many :reviews, dependent: :destroy

  has_many :shelves, dependent: :destroy
  has_many :department, through: :shelves


  validates :name, presence: true,
                   uniqueness: { case_sensitive: false }


end
