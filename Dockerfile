FROM python:3.11.5-alpine3.18

COPY requirements.txt .

RUN pip install -r requirements.txt

# COPY . /usr/bot/

# WORKDIR /usr/bot/
COPY . .

RUN chmod +x entrypoint.sh

CMD ["ls"]
# CMD ["pwd"]

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
