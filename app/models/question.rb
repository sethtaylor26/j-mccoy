class Question < ActiveRecord::Base
  has_many :potential_answers
  QUESTION_TYPES = ['YN', 'EO']
  validates_inclusion_of :question_type, :in => QUESTION_TYPES
  validate :question, presence: true
  
  def self.import(file)
    spreadsheet = open_spreadsheet(file)
    header = spreadsheet.row(1)
    (2..spreadsheet.last_row).each do |i|
      row = Hash[[header, spreadsheet.row(i)].transpose]
      question = find_by_id(row["id"]) || new
      question.attributes = row.to_hash.slice(*Question.attribute_names())
      question.save!
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
