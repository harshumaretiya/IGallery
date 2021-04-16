class CreatePhotos < ActiveRecord::Migration[6.0]
  def change
    create_table :photos do |t|
      t.string :photo_name
      t.string :photo_title
      t.belongs_to :album, index: true
      t.timestamps
    end
  end
end
