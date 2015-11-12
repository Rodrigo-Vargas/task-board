class CreateLabels < ActiveRecord::Migration
  def change
    create_table :labels do |t|
      t.belongs_to :user, index: true
      t.string :color
      t.string :name

      t.timestamps null: false
    end
  end
end
