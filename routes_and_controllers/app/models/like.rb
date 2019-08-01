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
  belongs_to :likable, polymorphic: true

  
end
