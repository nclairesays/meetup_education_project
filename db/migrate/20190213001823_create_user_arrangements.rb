class CreateUserArrangements < ActiveRecord::Migration[5.2]
  def change
    create_table :user_arrangements do |t|
      t.belongs_to :user, foreign_key: true
      t.belongs_to :event, foreign_key: true

      t.timestamps
    end
  end
end
