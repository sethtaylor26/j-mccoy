class EventTypeAnswerWeight < ActiveRecord::Base
  belongs_to :potential_answer
  belongs_to :event_type
  
    def self.import(file)
    spreadsheet = open_spreadsheet(file)
    header = spreadsheet.row(1)
    (2..spreadsheet.last_row).each do |i|
      row = Hash[[header, spreadsheet.row(i)].transpose]
      event_type_answer_weight = find_by_id(row["id"]) || new
      event_type_answer_weight.attributes = row.to_hash.slice(*EventTypeAnswerWeight.attribute_names())
      event_type_answer_weight.save!
    end
  end

  def self.open_spreadsheet(file)
    case File.extname(file.original_filename)
      when ".csv" then Roo::Csv.new(file.path, nil, :ignore)
      when ".xls" then Roo::Excel.new(file.path, nil, :ignore)
      when ".xlsx" then Roo::Excelx.new(file.path, nil, :ignore)
      else raise "Unknown file type: #{file.original_filename}"
    end
  end
  
end
