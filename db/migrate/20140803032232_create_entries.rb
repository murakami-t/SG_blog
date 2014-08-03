class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.string :title
      t.string :body
      t.references :blog, index: true

      t.timestamps
    end
  end
end
