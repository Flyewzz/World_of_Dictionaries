class CreateWords < ActiveRecord::Migration[5.2]
  def change
    create_table :words do |t|
      t.string :russian
      t.string :english
      t.timestamps
    end
  end
end
