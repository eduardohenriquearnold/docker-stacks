# Copyright (c) Jupyter Development Team.
# Distributed under the terms of the Modified BSD License.
FROM cuda-notebook

MAINTAINER Jupyter Project <jupyter@googlegroups.com>

USER root

# Install Pytorch with GPU support
RUN conda install --yes  pytorch torchvision cuda80 -c soumith

#Install Tensorflow with GPU support
RUN conda install --yes  'tensorflow-gpu' 'keras=2.0*'

#Install OpenCV and deps
RUN conda install --yes 'opencv=3.3' && apt-get update && apt-get -y install libxext-dev

#Install Jupyter theme plugin 
RUN pip install jupyterthemes && jt -t onedork -N

#Clean env
RUN conda clean -tipsy && \
    fix-permissions $CONDA_DIR && \
    fix-permissions $HOME

USER $NB_USER
