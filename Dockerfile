FROM python:3.9-slim

WORKDIR /app

COPY . .

# Install system dependencies for tkinter and other required libraries
RUN apt-get update && apt-get install -y python3-tk libglib2.0-dev binutils

# Upgrade pip
RUN pip install --upgrade pip

# Install PyInstaller and package the application
RUN pip install pyinstaller && pyinstaller --onefile app.py

# Set the command to run the packaged application
CMD ["./dist/app"]
