class Event < ActiveRecord::Base    
  belongs_to :event_type
  belongs_to :recommender
  
  has_many :open_hours
  
  validates :event_type_id, presence: true
  validates :start_time, presence: true
  validates :end_time, presence: true
  validates :title, presence: true
  validates :location_lat, presence: true
  validates :location_long, presence: true
  validates :spice, presence: true
  validates :cost, presence: true

  mount_uploader :image, ImageUploader
  
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
