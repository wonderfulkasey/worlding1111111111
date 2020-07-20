class CreateWorlds < ActiveRecord::Migration[6.0]
  def change
    create_table :worlds do |t|
      t.string :name
      t.text :aesthetic
      t.text :big_bad
      t.text :description

      t.integer :user_id

      t.timestamps
    end
  end
end
