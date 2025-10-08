# Используем Ubuntu 22.04 как базу
FROM ubuntu:22.04

# Устанавливаем зависимости для сборки Qt C++ проекта
RUN apt-get update && apt-get install -y \
    build-essential \
    cmake \
    qt6-base-dev \
    qt6-tools-dev \
    qt6-tools-dev-tools \
    qt6-declarative-dev \
    qt6-linguist-tools \
    qt6-svg-dev \
    git \
    wget \
    && rm -rf /var/lib/apt/lists/*

# Рабочая директория
WORKDIR /app

# Копируем весь проект в контейнер
COPY . .

# Создаем папку сборки и собираем проект
RUN mkdir build && cd build && cmake .. && make -j$(nproc)

# Запуск приложения (замени TaskManager на имя вашего исполняемого файла)
CMD ["./build/TaskManager"]
