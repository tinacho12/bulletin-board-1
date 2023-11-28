# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  body       :text
#  expires_on :date
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  board_id   :integer
#
class Post < ApplicationRecord
  validates(:title, presence: true)
  validates(:body, presence: true)
  validates(:expires_on, presence: true)
  ## Direct associations

  # Post#board: returns rows from the boards table associated to this post by the board_id column
  belongs_to(:posted_to_board, class_name: "Board", foreign_key: "board_id")

end
