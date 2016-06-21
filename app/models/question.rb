class Question < ActiveRecord::Base
  belongs_to :user
  
  def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << User.column_names
      User.all.each do |product|
        csv << product.attributes.values_at(*User.column_names)
      end
      
      csv << column_names
      all.each do |product|
        csv << product.attributes.values_at(*column_names)
      end
    end
  end
end
