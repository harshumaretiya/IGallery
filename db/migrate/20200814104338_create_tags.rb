class CreateTags < ActiveRecord::Migration[6.0]
  def change
    create_table :tags do |t|
      t.references :photo, null: false, foreign_key: true
      t.string :name

      t.timestamps
    end
  end
end
