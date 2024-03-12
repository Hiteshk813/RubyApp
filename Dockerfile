# Use the official Ruby image as the base image
FROM ruby:3.0.3

# Set the working directory inside the container
WORKDIR /app

# Install dependencies
RUN apt-get update -qq && \
    apt-get install -y nodejs && \
    gem install bundler

# Copy Gemfile and Gemfile.lock into the container
COPY Gemfile Gemfile.lock ./

# Install gems
RUN bundle install

# Copy the rest of the application code into the container
COPY . .

# Expose port 3000 to the outside world
EXPOSE 3000

# Start the Rails server
CMD ["rails", "server", "-b", "0.0.0.0"]
