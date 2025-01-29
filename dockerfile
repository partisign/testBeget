# Используем официальный образ Node.js
FROM node:18-alpine

# Устанавливаем рабочую директорию
WORKDIR /app

# Копируем package.json и package-lock.json
COPY package*.json ./

# Устанавливаем зависимости
RUN npm install

# Копируем весь код в контейнер
COPY . .

# Собираем приложение
RUN npm run build

# Открываем порт для сервера
EXPOSE 3000

# Команда запуска
CMD ["node", "dist/main"]