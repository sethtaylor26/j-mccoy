class EventType < ActiveRecord::Base
  has_many :events
  has_many :event_type_answer_weights
  validates :event_type_name, presence: true
  validates :image, presence: true

  mount_uploader :image, ImageUploader
  
  # This is not enabled in the UI until a solution for importing images throw CarrierWave is found
  def self.import(file)
    spreadsheet = open_spreadsheet(file)
    header = spreadsheet.row(1)
    (2..spreadsheet.last_row).each do |i|
      row = Hash[[header, spreadsheet.row(i)].transpose]
      event_type = find_by_id(row["id"]) || new
      event_type.attributes = row.to_hash.slice(*EventType.attribute_names())
      event_type.save!
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
