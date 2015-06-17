class CreateClicks < ActiveRecord::Migration
  def change
    create_table :clicks do |t|
      t.string :user_id
      t.datetime :date_time

      t.timestamps
    end
  end
end
