class Pic < ApplicationRecord  
  belongs_to :user
  has_one_attached :image
  validates_presence_of :name, :description, :image

  acts_as_votable

  def reduce_image_size
    return self.image.variant(resize: '400x400!').processed
  end
  
end
