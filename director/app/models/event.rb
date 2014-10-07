class Event < ActiveRecord::Base
  belongs_to :event_type
  validates :event_type_id, presence: true
  
  belongs_to :recommender
  
  scope :start_time, -> (start_time) { where("start_time >= ?", start_time) }
  scope :end_time, -> (end_time) { where("end_time <= ?", end_time) }
  scope :cost, -> (cost) { where("cost <= ?", cost) }
  scope :spice, -> (spice) { where("spice <= ?", spice) }
  scope :title, lambda{|l|  where("title LIKE :l", l: "%#{l}%")}
  
  def self.import(file)
    spreadsheet = open_spreadsheet(file)
    header = spreadsheet.row(1)
    (2..spreadsheet.last_row).each do |i|
      row = Hash[[header, spreadsheet.row(i)].transpose]
      event = find_by_id(row["id"]) || new
      event.attributes = row.to_hash.slice(*Event.attribute_names())
      event.save!
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
