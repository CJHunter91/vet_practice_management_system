require_relative('../db/sql_runner')

class date 

  def initialize(params)
    @id = params['id']
    @year = params['year'].to_i
    @month = params['month'].to_i
    @day = params['day'].to_i
    @quarter = params['quarter'].to_i
    @day_of_week = params['day_of_week'].to_i
    @day_of_year = params['day_of_year'].to_i
    @week_of_year = params['week_of_year'].to_i
  end

  def get_day_appointments

  end

  def get_date

  end
end
