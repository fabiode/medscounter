require 'rails'
require 'tty-prompt'

class Medication
  @@pills_by_day = { keppra250: 4, keppra750: 2, depakene250: 2, zodel: 1 }

  def initialize

  end

  def pills_names
    pills_by_day.keys
  end

  def calculate_dates(result)
    current_day = Date.today
    result.each do |pill_name, pill_count|
      remaining_days = pill_count / pills_by_day[ pill_name ]
      puts "You still have #{pill_name} until #{I18n.l(current_day + remaining_days.days, format: :long)} [#{remaining_days} days left]"
    end
  end

  private

  def pills_by_day
    @@pills_by_day
  end

end	

medication_manager = Medication.new
prompt = TTY::Prompt.new

result = prompt.collect do
  medication_manager.pills_names.each do |pill_name|
   key(pill_name).ask("Amount of #{pill_name.to_s}:", convert: :int)
  end
end

medication_manager.calculate_dates(result)
