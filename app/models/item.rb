class Item < ApplicationRecord
  validates :name, presence: true
  validates :price, presence: true, 
                    numericality: { greater_than: 0 }
  belongs_to :category

  has_one_attached :cover #要放圖片

  default_scope { where(deleted_at: nil)}

  def destroy
    update(deleted_at: Time_now)
  end

end
