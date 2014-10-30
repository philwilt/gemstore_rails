class Product < ActiveRecord::Base
  validates :name, :description, :price, presence: true

  def active_model_serializer
      ProductSerializer
  end
end
