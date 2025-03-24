# Usamos la imagen base de Python
FROM python:3.10-slim

# Instalamos las dependencias del sistema necesarias para mysqlclient
RUN apt-get update && apt-get install -y \
    pkg-config \
    libmariadb-dev \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

# Establecemos el directorio de trabajo
WORKDIR /app

# Copiamos el archivo de requerimientos
COPY requirements.txt .

# Instalamos las dependencias de Python
RUN pip install --no-cache-dir -r requirements.txt

# Copiamos el código fuente
COPY . .

# Exponemos el puerto en el que corre la aplicación
EXPOSE 8000

# Comando por defecto para correr la aplicación
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
