class AddLabelsToCards < ActiveRecord::Migration
  def change
    create_table :cards_labels, id: false do |t|
      t.belongs_to :card, index: true
      t.belongs_to :label, index: true
    end
  end
end
