# Python base image
FROM python:3.7

# Create and set the work directory inside the image named 'app'
WORKDIR /application

# Copy 'requirements.txt' file
COPY ./requirements.txt .

# Install application dependencies using 'requirements.txt'
RUN pip3 install -r requirements.txt

# Copy the app file into the image working directory
COPY . .

# Run 'python app.py' on container start-up. 
ENTRYPOINT ["python3", "app.py"]
