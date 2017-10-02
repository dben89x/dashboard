class CreateMeetups < ActiveRecord::Migration[5.0]
  def change
    create_table :meetups do |t|

      t.timestamps
    end
  end
end
