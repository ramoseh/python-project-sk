FROM alpine
RUN apk update && apk upgrade
RUN apk add --no-cache curl build-base python3 pkgconfig python3-dev openssl-dev libffi-dev musl-dev make gcc linux-headers
RUN apk add --update python3 py-pip

RUN  pip install --upgrade pip \
    && pip install fastapi

COPY requirements.txt /src/requirements.txt
RUN pip install -r /src/requirements.txt
ADD ./app /src/app

WORKDIR /src/app

CMD ["uvicorn", "main:app","--host","0.0.0.0", "--port", "15400"]