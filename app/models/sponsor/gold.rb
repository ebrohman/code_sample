class Sponsor::Gold < Sponsor::Company

  def name
    raise 'UNKNOWN ERROR'
  end

  def update_net_worth
    super(gold_bonus)
  end

  def gold_bonus
    9000000
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
