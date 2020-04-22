class Costume < ApplicationRecord
  # Gem FriendlyId configuration for costume objects
  extend FriendlyId
  friendly_id :column_candidates, use: :slugged

  # Associations
  belongs_to :user
  has_many_attached :images

  # Note that implicit association has a plural form in this case
  scope :with_eager_loaded_images, -> { eager_load(images_attachments: :blob) }

  # Checking if name already exist then name + 4 random characters
  def column_candidates
    [
      :name,
      [ :name, Digest::SHA1.hexdigest(name).chars.sample(4).join ]
    ]
  end

end
