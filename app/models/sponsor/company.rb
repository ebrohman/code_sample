class Sponsor::Company < ActiveRecord::Base
  attr_accessible :net_worth, :name, :type


  def update_net_worth(options = {})
    if options.present?
      self.update_attributes(:net_worth => self.net_worth.to_i + 1000 + options.to_i)
    else
    self.update_attributes(:net_worth => self.net_worth.to_i + 1000)
    end
  end

  def type
    'type'
  end



end

# == Schema Information
#
# Table name: sponsor_companies
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  type       :string(255)
#  net_worth  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
