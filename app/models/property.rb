# == Schema Information
#
# Table name: properties
#
#  id         :integer          not null, primary key
#  address    :string
#  type       :string
#  price      :float
#  value      :float
#  contact_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Property < ApplicationRecord
end
