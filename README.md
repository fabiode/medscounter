MedsCoutner

```
medication_manager = Medication.new
prompt = TTY::Prompt.new

result = prompt.collect do
medication_manager.pills_names.each do |pill_name|
key(pill_name).ask("Amount of #{pill_name.to_s}:", convert: :int)
end
end

medication_manager.calculate_dates(result)
```
