require 'date'

class Forecast
  CLOUDINESS = {0 => 'Ясно', 1 => 'Малооблачно', 2 => 'Облачно', 3 => 'Пасмурно'}
  TIMES_OF_DAY = {0 => 'Ночью', 1 => 'Утром', 2 => 'Днем', 3 => 'Вечером'}

  attr_reader :date, :times_of_day, :min_temp, :max_temp, :max_wind, :cloudiness

  def self.from_xml(forecast)
    collection =
      forecast.map do |period|
        day = period.attributes['day']
        month = period.attributes['month']
        year = period.attributes['year']

        new(
          date: Date.parse("#{day}.#{month}.#{year}"),
          times_of_day: TIMES_OF_DAY[period.attributes['tod'].to_i],
          min_temp: period.elements['TEMPERATURE'].attributes['min'].to_i,
          max_temp: period.elements['TEMPERATURE'].attributes['max'].to_i,
          max_wind: period.elements['WIND'].attributes['max'].to_i,
          cloudiness: CLOUDINESS[period.elements['PHENOMENA'].attributes['cloudiness'].to_i]
        )
      end

    collection
  end

  def initialize(params)
    @date = params[:date]
    @times_of_day = params[:times_of_day]
    @min_temp = params[:min_temp]
    @max_temp = params[:max_temp]
    @max_wind = params[:max_wind]
    @cloudiness = params[:cloudiness]
  end

  def to_s
    <<~TEXT
      #{date_string} #{times_of_day.downcase}
      #{min_temp}..#{max_temp}, ветер #{max_wind} м/с, #{cloudiness}
    TEXT
  end

  def date_string
    return 'Сегодня' if date == Date.today

    date.strftime('%d.%m.%Y,')
  end
end
