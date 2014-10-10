class CreateImagesTags < ActiveRecord::Migration
  def change
    create_table :images_tags do |t|
      t.references :image, index: true
      t.references :tag, index: true

      t.timestamps
    end
  end
end
