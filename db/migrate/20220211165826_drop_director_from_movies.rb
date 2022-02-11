class DropDirectorFromMovies < ActiveRecord::Migration[6.0]
  def change
    remove_column :movies, :director, :string
  end
end
