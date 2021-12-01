FROM gcc:latest

RUN apt-get update && \
    apt-get install -y cmake python3 python3-pip

RUN pip install --upgrade pip

RUN useradd -ms /bin/bash -g root -G sudo techproguser

USER techproguser

WORKDIR /home/techproguser/cmake_with_flask

COPY . .

USER root
RUN cmake ../cmake_with_flask && \
    cmake --build . && \
    pip install Flask
USER techproguser

EXPOSE 5000
CMD ./bin/C && python3 app.py --host=0.0.0.0 --port=5000

#ENTRYPOINT ["bash"]