FROM python:3.10.8-slim-bullseye

# Update apt and install git
RUN apt update && apt upgrade -y
RUN apt install git -y

# Copy requirements.txt and install dependencies
COPY requirements.txt /requirements.txt
RUN pip3 install -U pip && pip3 install -U -r /requirements.txt

# Create and set the working directory for your bot
RUN mkdir /VJ-FILTER-BOT
WORKDIR /VJ-FILTER-BOT

# Copy the bot files to the working directory
COPY . /VJ-FILTER-BOT

# Run the bot
CMD ["python", "bot.py"]
