VER=0.6.0
IMAGE_NAME=/tmp/niftynet_gpu_${VER}.simg

#build
sudo singularity build ${IMAGE_NAME} ./Singularity.${VER}

# test tensorflow
# -W ignore: ignore futurewarning
singularity exec --nv ${IMAGE_NAME} python -W ignore -c "import tensorflow as tf; print('TensorFlow version: ' + tf.__version__)"

# test keras
singularity exec --nv ${IMAGE_NAME} python -W ignore -c "import tensorflow.keras as keras;print('Keras version: ' + keras.__version__)"

# test NiftyNet
singularity exec --nv ${IMAGE_NAME} net_download -h

# test nibabel
singularity exec --nv ${IMAGE_NAME} python -c "import nibabel; print('nibabel info: ', nibabel.get_info())"

# test opencv
singularity exec --nv ${IMAGE_NAME} python -c "import cv2; print('Opencv version: ' + cv2.__version__)"

# test skimage
singularity exec --nv ${IMAGE_NAME} python -c "import skimage; print('skimage version: ' + skimage.__version__)"

# test pillow
singularity exec --nv ${IMAGE_NAME} python -c "import PIL; print('PIL version: ' + PIL.__version__)"

# test simpleitk
singularity exec --nv ${IMAGE_NAME} python -c "import SimpleITK as sitk; print('SimpleITK version: ' +  sitk.Version_VersionString())"
