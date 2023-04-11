# Use python as Base Image
FROM python:3.8

#creating a work directory
WORKDIR /app
#adding path for libiio and pyadiio
ADD ./install_libiio.sh /app
ADD ./install_pyadi-iio.sh /app

#update and install dependencies
RUN apt-get -y update
RUN apt-get -y install bison flex cmake git xdg-utils \
  libxml2 libxml2-dev libcdk5-dev libaio-dev \
  libusb-1.0-0-dev libserialport-dev libavahi-client-dev \
  libavahi-common-dev libgtk2.0-dev libgtkdatabox-dev \
  libmatio-dev libfftw3-dev libcurl4-openssl-dev \
  libjansson-dev libcanberra-gtk-module packagekit-gtk3-module

#installing libiio
RUN ./install_libiio.sh
RUN ./install_pyadi-iio.sh

#cmd line
CMD [ "python", "pyadi-iio/examples/max11205_example.py" ]


