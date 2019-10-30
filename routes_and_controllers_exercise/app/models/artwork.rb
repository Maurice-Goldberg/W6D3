# == Schema Information
#
# Table name: artworks
#
#  id         :integer          not null, primary key
#  image_url  :string           not null
#  artist_id  :integer          not null
#  title      :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Artwork < ApplicationRecord
    validates :image_url, :artist_id, :title, presence: true
    validates :title, uniqueness: { scope: :artist_id }
    
    belongs_to :artist,
        primary_key: :id,
        foreign_key: :artist_id,
        class_name: :User

    has_many :artwork_shares,
        primary_key: :id,
        foreign_key: :artwork_id,
        class_name: :ArtworkShare

    has_many :viewers,
        through: :artwork_shares,
        source: :viewer

end
