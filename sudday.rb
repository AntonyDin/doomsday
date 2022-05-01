# пишем программу на методах, потом идем к сложному

# переменные
@humans = 10
@machines = 10
#--------------------------------------------------------------------
# ВСПОМОГАТЕЛЬНЫЕ МЕТОДЫ

# Метод возвращает случайное значение: true или false
def luck?
  rand(0..1) == 1
end
# метод взрыв, если тру (лак), то вычитаем машины и наоборот
def boom
  diff = rand(1..5)
  if luck?
    @machines -= diff
    puts "#{diff} машин уничтожено"
  else
    @humans -= diff
    puts "#{diff} людей погибло"
  end
end

# Метод возвращает случайное название города
def random_city
  case dice = rand(1..5)
  when 1
    'Москва'
  when 2
    'Лос-Анджелес'
  when 3
    'Пекин'
  when 4
    'Лондон'
  else
    'Сеул'
  end
end

def random_sleep
  sleep rand(0.3..1.5)
end

def stats
  puts "Осталось #{@humans} людей и #{@machines} машин"
end
#--------------------------------------------------------------------

#--------------------------------------------------------------------
# СОБЫТИЯ
def event1
  puts "Запущена ракета по городу #{random_city}"
  random_sleep
  boom
end

def event2
  puts "Применено радиоактивное оружие в городе #{random_city}"
  random_sleep
  boom
end

def event3
  puts "Группа солдат прорывает оборону противника в городе #{random_city}"
  random_sleep
  boom
end
#--------------------------------------------------------------------

#--------------------------------------------------------------------
# ПРОВЕРКА ПОБЕДЫ
def check_victory?
  if @humans <= 0 and @machines > 0
    puts "Машины победили"
    exit
  elsif @machines <= 0 and @humans > 0
    puts "Победили люди"
    exit
  end
end

# главный цикл, если победа выходим
loop do
# вызываем метод проерки победы
  if check_victory?
  end
  # в зависимости от выбрашенной игральной кости, идет событие
  case dice = rand(1..3)
  when 1
    event1
  when 2
    event2
  when 3
    event3
  end
end

