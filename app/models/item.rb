class Item < ApplicationRecord
  belongs_to :user
  mount_uploader :itemimage, ItemImageUploader
end
