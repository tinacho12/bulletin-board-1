# == Schema Information
#
# Table name: boards
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Board < ApplicationRecord
  validates(:name, presence: true, uniqueness: true)

  # Scoped direct association
  # Board#ActivePosts: returns rows from the posts table associated with this board by board_id column, where the expires_on date is before today
  has_many(:active_posts, -> { where("expires_on < ?", Date.today) }, class_name: "Post", foreign_key: :board_id)
  # Board#ExpiredPosts: returns rows from the posts table associated with this board by board_id column, where the expires_on date is after today
  has_many(:expired_posts, -> { where("expires_on > ?", Date.today) }, class_name: "Post", foreign_key: :board_id)

end
