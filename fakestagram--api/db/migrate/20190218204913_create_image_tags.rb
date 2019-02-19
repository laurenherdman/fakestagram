class CreateImageTags < ActiveRecord::Migration[5.2]
  def change
    create_table :image_tags do |t|
      t.belongs_to :image, index: true
      t.belongs_to :tag, index: true
      t.timestamps
    end
  end
end
