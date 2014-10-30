class Product < ActiveRecord::Base
  belongs_to :category
  validates :name, :description, :price, presence: true

  def active_model_serializer
      ProductSerializer
  end
end
