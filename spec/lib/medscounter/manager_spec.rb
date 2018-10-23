require 'spec_helper'
require './lib/medscounter'

module MedsCounter
  RSpec.describe Manager do

    let(:manager) { Manager.new }

    let(:meds) do
      [
        { name: :keppra250, pills_by_day: 4 },
        { name: :keppra750, pills_by_day: 2 },
        { name: :depakene, pills_by_day: 2 },
        { name: :zodel, pills_by_day: 1 },
      ]
    end

    before do
      meds.each do |med|
        manager.track Medication.new(name: med[:name], pills_by_day: med[:pills_by_day])
      end
    end

    describe 'calculate_dates' do
      context 'with 40 of each' do

        let(:user_input) do
          {
            keppra250: 40,
            keppra750: 40,
            depakene: 40,
            zodel: 40,
          }
        end

        let(:expected) do
          [
            "You still have keppra250 until November 02, 2018 [10 days left]",
            "You still have keppra750 until November 12, 2018 [20 days left]",
            "You still have depakene until November 12, 2018 [20 days left]",
            "You still have zodel until December 02, 2018 [40 days left]",
          ].join("\n")
        end

        it do
          expect(manager.calculate_dates(user_input)).to eq expected
        end
      end
    end


  end
end
