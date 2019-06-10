module DateService
  def format_date(date)
    return if date.nil?

    I18n.l(date, format: '%A, %e. %B %Y').to_s
  end

  def parse_date(date)
    Date.parse(date)
  end

  module_function :format_date, :parse_date
end
