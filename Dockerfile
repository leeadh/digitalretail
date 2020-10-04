# set base image (host OS)
FROM python:3.8

WORKDIR /app
COPY . /app
COPY requirements.txt /app/requirements.txt
RUN pip install -r requirements.txt
ENV STRIPE_PUBLISHABLE_KEY=$STRIPE_PUBLISHABLE_KEY
ENV STRIPE_SECRET_KEY=$STRIPE_SECRET_KEY
ENV POSTGRES_URL=$POSTGRES_URL
ENV POSTGRES_USER=$POSTGRES_USER
ENV POSTGRES_PW=$POSTGRES_PW
ENV POSTGRES_DB=$POSTGRES_DB
ENV FB_CLIENT_ID=$FB_CLIENT_ID
ENV FB_CLIENT_SECRET=$FB_CLIENT_SECRET


EXPOSE 5000

# command to run on container start
CMD export ENV FLASK_APP="server/app.py" && flask run --cert=adhoc --host 0.0.0.0