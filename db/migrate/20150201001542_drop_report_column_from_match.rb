class DropReportColumnFromMatch < ActiveRecord::Migration
  def change
    remove_column :matches, :report
  end
end
