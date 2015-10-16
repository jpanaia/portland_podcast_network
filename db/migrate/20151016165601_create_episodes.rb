class CreateEpisodes < ActiveRecord::Migration
  def change
    create_table :episodes do |t|
      t.string :title
      t.string :description
      t.string :text
      t.references :podcast, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
