#
#!/bin/bash
#
cd ../app
git clone https://github.com/analogdevicesinc/pyadi-iio.git
cd ./pyadi-iio
pip install .
pip install -r requirements.txt
pip install -r requirements_dev.txt
pip install -r requirements_prod_test.txt
pip install -r requirements_doc.txt