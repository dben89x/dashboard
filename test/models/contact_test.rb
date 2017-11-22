# == Schema Information
#
# Table name: contacts
#
#  id             :integer          not null, primary key
#  first_name     :string
#  phone          :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  email          :string
#  project        :string
#  business       :string
#  date_met       :date
#  last_contacted :date
#  where_met      :string
#  last_name      :string
#  notes          :text
#

require 'test_helper'

class ContactTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
