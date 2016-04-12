# TODO: consider to delete this file.
# This migration change a default value of a column in document_person_maps
# table, which is not essential and is logically incorrect, though it will
# not affect anything. Delete this file will not affect the schema of the
# database. But database may have to rebuild, since this operation prevent
# us call db:rollback.

class ChangeColumnDefaultRankToDocumentPersonMaps < ActiveRecord::Migration
  def change
    change_column_default :document_person_maps, :rank, 0
  end
end
