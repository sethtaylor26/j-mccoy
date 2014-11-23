class PotentialAnswer < ActiveRecord::Base
  belongs_to :question
  has_many :event_type_answer_weights
  has_many :user_answers
  
  validates :answer, presence: true
  
  def self.import(file)
    spreadsheet = open_spreadsheet(file)
    header = spreadsheet.row(1)
    (2..spreadsheet.last_row).each do |i|
      row = Hash[[header, spreadsheet.row(i)].transpose]
      potential_answer = find_by_id(row["id"]) || new
      potential_answer.attributes = row.to_hash.slice(*PotentialAnswer.attribute_names())
      potential_answer.save!
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

  def display_name
    question.question + " " + answer
  end
end
