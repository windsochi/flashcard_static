Time::DATE_FORMATS[:month_and_year] = '%d/%m/%Y'
Time::DATE_FORMATS[:short_ordinal]  = ->(time) { time.strftime("%B #{time.day.ordinalize}") }

