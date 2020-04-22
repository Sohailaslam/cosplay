class AddSlugToCostumes < ActiveRecord::Migration[6.0]
  def change
    add_column :costumes, :slug, :string
    add_index :costumes, :slug, unique: true
  end
end
