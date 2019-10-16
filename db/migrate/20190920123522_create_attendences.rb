class CreateAttendences < ActiveRecord::Migration[5.2]
  def change
    create_table :attendences do |t|
      t.date :datee
      t.datetime :check_in
      t.datetime :check_out
      t.boolean :status
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
