# encoding: utf-8

# Программа-фоторобот, которая «собирает» лицо из фрагментов.

# Заведем четыре переменные с путями к файлам с набором для каждого фрагмента.
# Обратите внимание, что файлы с набором фрагментов нужно создавать папке data,
# которая находится в той же папке, где находится программа.
current_path = File.dirname(__FILE__)
foreheads_path = current_path + "/data/foreheads.txt"
eyes_path = current_path + "/data/eyes.txt"
noses_path = current_path + "/data/noses.txt"
mouths_path = current_path + "/data/mouths.txt"

# Проверяем есть ли файл со лбами
if File.exist?(foreheads_path)
  # Если есть, открываем файл, явно указывая его кодировку UTF-8
  file = File.new(foreheads_path, "r:UTF-8")

  # И считываем все его строки в массив foreheads
  foreheads = file.readlines
  file.close # закрываем файл
else
  # Если не найдет, сообщаем об этом пользователю и выходим с ошибкой
  abort "Лбы не найдены"
end

# Поступаем аналогично для всех частей лица

if File.exist?(eyes_path)
  file = File.new(eyes_path, "r:UTF-8")
  eyes = file.readlines
  file.close
else
  abort "Глаза не найдены"
end

if File.exist?(noses_path)
  file = File.new(noses_path, "r:UTF-8")
  noses = file.readlines
  file.close
else
  abort "Носы не найдены"
end

if File.exist?(mouths_path)
  file = File.new(mouths_path, "r:UTF-8")
  mouths = file.readlines
  file.close
else
  abort "Рты не найдены"
end

# Рисуем уникальную рожицу, выбирая произвольный элемент из каждого массива
puts foreheads.sample
puts eyes.sample
puts noses.sample
puts mouths.sample

time = Time.now

file_name = time.strftime("%Y-%m-%d-%H-%M-%S")

file = File.new("face" + file_name + ".txt", "w:UTF-8")

file.puts(foreheads.sample)
file.puts(eyes.sample)
file.puts(noses.sample)
file.puts(mouths.sample)