class Bookmark < ApplicationRecord
  belongs_to :movie
  belongs_to :list
  validates :comment, length: { minimum: 6 }
  validates :movie, uniqueness: { scope: :list }
  # validates :movie_id, presence: true, allow_blank: false, uniqueness: { scope: :list_id }
end
