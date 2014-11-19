class OpenHour < ActiveRecord::Base
  belongs_to :event

  DAYS = ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday']
  validates_inclusion_of :day_of_the_week, :in => DAYS
  validate :day_of_the_week, presence: true
  validate :event_id, presence: true
  validate :open_hour, presence: true
  validate :close_hour, presence: true

  def self.import(file)
    spreadsheet = open_spreadsheet(file)
    header = spreadsheet.row(1)
    (2..spreadsheet.last_row).each do |i|
      row = Hash[[header, spreadsheet.row(i)].transpose]
      open_hour = find_by_id(row["id"]) || new
      open_hour.attributes = row.to_hash.slice(*OpenHour.attribute_names())
      open_hour.save!
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
    day_of_the_week + " " + open_hour + " to " + close_hour
  end
end
