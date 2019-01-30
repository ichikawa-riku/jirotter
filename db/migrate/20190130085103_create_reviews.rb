class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.text :impression
      t.references :user
      t.references :product
      t.timestamps
    end
  end
end
