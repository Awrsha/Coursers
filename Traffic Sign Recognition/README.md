# Traffic Sign Recognition with Convolutional Neural Networks (CNN)

This repository contains the source code for a Traffic Sign Recognition system implemented using Convolutional Neural Networks (CNN). The project is designed to classify traffic signs, particularly stop signs, and determine whether they are present in the input images.

## Prerequisites

Before running the code, make sure you have the following dependencies installed:

- Python
- OpenCV
- Keras
- Matplotlib
- NumPy

You can install these dependencies using `pip`:

```
pip install opencv-python keras matplotlib numpy
```

## Usage

1. Clone the repository to your local machine:

```
git clone https://github.com/awrsha/traffic-sign-recognition.git
```

2. Navigate to the project directory:

```
cd traffic-sign-recognition
```

3. Run the `traffic_sign_recognition.py` script to train the CNN model:

```
python traffic_sign_recognition.py
```

4. Once the training is complete, you can use the trained model to make predictions on traffic sign images:

```python
from keras.preprocessing import image
import numpy as np

# Load an image
vehicle_file = 'path_to_image.jpg'
v_img = image.load_img(vehicle_file, target_size=(150, 150))
v_img = image.img_to_array(v_img)
v_img = np.expand_dims(v_img, axis=0)
v_img = v_img / 255

# Make predictions
prediction_prob = model.predict(v_img)
print(f'Probability that image contains a stop sign: {prediction_prob[0][0]}')
```

## Model and Training

The code includes a CNN model that is trained to recognize traffic signs. The training data is stored in the 'signs/train' directory, and the test data is in the 'signs/test' directory.

You can modify the model architecture, hyperparameters, and data augmentation settings in the script to improve the model's performance.

## Contributing

This is an open-source project and contributions are welcome. To contribute, please fork this repository and submit a pull request with your changes.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Developers 👨🏻‍💻

<p align="center">
<a href="https://github.com/Awrsha"><img src="https://avatars.githubusercontent.com/u/89135083?v=4" width="100;" alt="Awrsha Parvizi"/><br /><sub><b>.:: Amir M. Parvizi ::.</b></sub></a>
</p>

## System & Hardware 🛠  
<br> <summary><b>⚙️ Things I use to get stuff done</b></summary> <ul> <li><b>OS:</b> Windows 11</li> <li><b>Laptop: </b>TUF Gaming</li> <li><b>Code Editor:</b> Visual Studio Code - The best editor out there.</li> <li><b>To Stay Updated:</b> Medium, Linkedin and Instagram.</li> <br /> ⚛️ Checkout Our VSCode Configrations <a href="">Here</a>. </ul> <p align="center">💙 If you like my projects, Give them ⭐ and Share it with friends!</p></p><p align="center"><img height="27" src="https://raw.githubusercontent.com/mayhemantt/mayhemantt/Update/svg/Bottom.svg" alt="Github Stats" /></p>

<p align="center">
<img src="https://raw.githubusercontent.com/mayhemantt/mayhemantt/Update/svg/Bottom.svg" alt="Github Stats" />
