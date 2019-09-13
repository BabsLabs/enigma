class Date

  def self.generate_todays_date
    Time.now.strftime('%d%m%y').to_s
  end

end
