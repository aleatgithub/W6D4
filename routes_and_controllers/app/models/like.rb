# == Schema Information
#
# Table name: likes
#
#  id           :bigint           not null, primary key
#  liker_id     :integer          not null
#  likable_type :string
#  likable_id   :bigint
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Like < ApplicationRecord
  validates :liker_id, uniqueness: {scope: [:likable_id, :likable_type]}

  belongs_to :likable, polymorphic: true


end
