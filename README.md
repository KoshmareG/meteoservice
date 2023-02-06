# Meteoservice

An application with a weather forecast for the next day. In the application, you can view the weather for 35 of the largest cities in Russia.

Weather information is taken from [meteoservice](https://www.meteoservice.ru/).

The application was created in Ruby 3.1.2

Run:

```
$ ruby main.rb
```

### Viewing the weather

After starting, you will see a list of cities:

```
1. Москва
2. Санкт-Петербург
3. Новосибирск
4. Екатеринбург
5. Казань

...

34. Астрахань
35. Киров
```

Enter the number of the city you need:

```
>> 23
```

The app will return you the weather forecast:

```
Прогноз погоды для города: Иркутск

07.02.2023, ночью
-20..-18, ветер 1 м/с, Пасмурно

07.02.2023, утром
-20..-16, ветер 1 м/с, Малооблачно

07.02.2023, днем
-13..-9, ветер 1 м/с, Малооблачно

07.02.2023, вечером
-17..-10, ветер 1 м/с, Ясно
```

### Adding cities

You can change the list of cities in `data/city_codes.json`.

```
{
  "Москва": 37,
  "Санкт-Петербург": 69,
  "Новосибирск": 99,
  "Екатеринбург": 122,
  "Казань": 34796,

  ...

  "Астрахань": 5,
  "Киров": 2808
}
```

Add a city to the list in the format:

```
"<CITY_NAME>": <CITY_CODE>
```
