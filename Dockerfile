FROM continuumio/miniconda
SHELL ["/bin/bash","-c"]
RUN conda config --add channels conda-forge && conda create -n diced -c flyem-forge diced
RUN source activate diced & pip install git+https://github.com/janelia-flyem/diced.git
WORKDIR /code
COPY . /code
VOLUME /data
ENTRYPOINT ["/bin/bash","-c"]
EXPOSE 8000
CMD ["source activate diced  && python diced_startup.py "]
