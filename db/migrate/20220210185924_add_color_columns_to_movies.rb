class AddColorColumnsToMovies < ActiveRecord::Migration[6.0]
  def change
    add_column :movies, :color_format, :integer, null: false, default: 0
  end
end
