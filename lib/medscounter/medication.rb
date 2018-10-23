module MedsCounter
  class Medication

    attr_reader :name, :pills_by_day

    def initialize(name:, pills_by_day:)
      @name = name
      @pills_by_day = pills_by_day
    end

  end
end
