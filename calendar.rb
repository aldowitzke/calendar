require 'date'

class Calendar
  def initialize()
    @dates = []
    @weekdays = ['mo', 'tu', 'we', 'th', 'fr', 'sa', 'su']
    @month = Time.now.strftime('%B')
    @year = Time.now.strftime('%Y')
    @number_of_days = Date.new(Date.today.year,Date.today.month,-1).day
    @first_day_of_month_weekday = Date.new(Date.today.year,Date.today.month,1).wday
  end

  def call
    print_month_and_year
    print_weekdays
    create_dates_array
    print_days
  end

  private

  def print_month_and_year
    puts "#{@month} #{@year}"
  end

  def print_weekdays
    puts @weekdays.join(' ')
  end

  def create_dates_array
    (0..Date.new(Date.today.year,Date.today.month,1).wday - 1).each do |i|
      @dates[i] = nil
    end

    (1..@number_of_days).each do |day|
      @dates << day
    end
  end

  def print_days
    weeks = @dates.each_slice(7).to_a

    weeks.each do |week|
      week.each do |day|
        if day.nil?
          print "   "
        elsif day >= 10
          print "#{day} "
        else
          print "#{day}  "
        end
      end

      puts "\n"
    end
  end
end
