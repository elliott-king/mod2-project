class Position < ActiveRecord::Base
  has_many :applications
  has_many :candidates, through: :applications
  belongs_to :company

  validates :title, :description, :how_to_apply, :position_type, :location, presence: true 


  #create methods start here
  #search_postions with desired attributes
  def self.search_title(title)
    self.all.select do |position|
      position.title.downcase.include?(title.downcase)
    end.uniq
  end

  def self.search_location(location)
    self.all.select do |position|
      position.location.downcase.include?(location.downcase)
    end.uniq
  end

  def self.search_company(company)
    self.all.select do |position|
      position.company.name.downcase.include?(company.downcase)
    end.uniq
  end

  def self.search_type(type)
    self.all.select do |position|
      position.position_type.downcase.include?(type.downcase)
    end.uniq
  end

  def self.search_recent_positions
    self.all.select do |position|
      d = DateTime.now - 5 
      position.created_at > d 
    end.uniq
  end

  def self.search_skill(skill)
    self.all.select do|position|
      position.description.downcase.include?(skill.downcase)
    end.uniq
  end

  def self.max_by_location
    location_hash = {}
    self.all.each do |position|
      location_key = position.location
      if !location_hash[location_key]
        location_hash[location_key] = 1
      else
        location_hash[location_key] += 1
      end
    end
    max_location_pair = location_hash.max_by {|k, v| v}
    puts "Location #{max_location_pair[0]} has the maximum number #{max_location_pair[1]} of positions."
  end

  #seems like every title only has 1 position
  def self.max_by_title
    title_hash = {}
    self.all.each do |position|
      title_key = position.title
      if !title_hash[title_key]
        title_hash[title_key] = 1
      else
        title_hash[title_key] += 1
      end
    end
    max_title_pair = title_hash.max_by {|k, v| v}
    puts "Title #{max_title_pair[0]} has the maximum number #{max_title_pair[1]} of positions."
  end

  def self.max_by_company
    company_hash = {}
    self.all.each do |position|
      company_key = position.company
      if !company_hash[company_key]
        company_hash[company_key] = 1
      else
        company_hash[company_key] += 1
      end
    end
    max_company_pair = company_hash.max_by {|k, v| v}
    puts "Company #{max_company_pair[0].name} has the maximum number #{max_company_pair[1]} of positions."
  end

end