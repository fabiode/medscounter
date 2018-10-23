module MedsCounter
  class Manager
    @@pills_by_day = { keppra250: 4, keppra750: 2, depakene250: 2, zodel: 1 }

    def track(medication)
      meds_list << medication
    end

    def pills_names
      meds_list.map(&:name)
    end

    def calculate_dates(pills_hash)
      output = []

      pills_hash.each do |pill_name, pill_count|
        pill = meds_list.detect { |med| med.name == pill_name }
        remaining_days = pill_count / pill.pills_by_day
        output << "You still have #{pill.name} until #{I18n.l(current_day + remaining_days.days, format: :long)} [#{remaining_days} days left]"
      end

      output.join("\n")
    end

    private

    def current_day
      Date.today
    end

    def meds_list
      @meds_list ||= []
    end

  end
end
