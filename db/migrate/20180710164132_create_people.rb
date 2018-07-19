class CreatePeople < ActiveRecord::Migration[5.2]
  def change
    create_table :people do |t|
      t.string :first_name
      t.string :last_name
      t.string :phone
      t.string :title
      t.string :email
      t.date :birthday

      t.timestamps
    end
  end
end
