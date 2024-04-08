<h1 align="center">
  <br>
  <a href="https://github.com/"><img src="https://github.com/Awrsha/Image-kernel-without-Padding/assets/89135083/3a3d3a9e-5b75-4f39-9e89-5a163a442517" alt="QUAD" width="600"></a>
  <b><h4 align="center">.:: 3D Trajectory Generation and Simulation ::.</h4></b>
</h1>

## Overview

This project is focused on 3D trajectory generation and simulation for a quadcopter. It provides a MATLAB-based environment to create and simulate different flight paths in three-dimensional space. The project includes several MATLAB script files and a collection of utility functions organized in a "utils" folder.

## Files and Components

### Main Scripts
1. **controller.m**: This script contains the controller logic for the quadcopter.
2. **evaluate.p**: An evaluation script that measures and analyzes the performance of the quadcopter controller.
3. **runsim.m**: This script initiates the simulation of the quadcopter.
4. **simulation_3d.m**: The primary script responsible for 3D quadcopter simulation.
5. **submit.m**: A script for submitting results or output.
6. **traj_gen.mat**: Data file for storing trajectory generation information.
7. **traj_generator.m**: A script for generating various trajectory patterns.
8. **traj_helix.m**: Generates a helical trajectory for the quadcopter.
9. **traj_line.m**: Generates a linear trajectory for the quadcopter.

### Utility Functions (Located in the "utils" folder)
1. **terminate_check.m**: A utility function to check for termination conditions in the simulation.
2. **sys_params.m**: Stores system parameters for the quadcopter.
3. **stateToQd.m**: Converts state information to quadcopter dynamics.
4. **RPYtoRot_ZXY.m**: Converts Roll-Pitch-Yaw angles to a rotation matrix in ZXY convention.
5. **RotToRPY_ZXY.m**: Converts a rotation matrix to Roll-Pitch-Yaw angles in ZXY convention.
6. **RotToQuat.m**: Converts a rotation matrix to quaternion.
7. **QuatToRot.m**: Converts a quaternion to a rotation matrix.
8. **QuadPlot.m**: Utility for plotting quadcopter's position and orientation.
9. **quadEOM_readonly.m**: Quadcopter's equations of motion (read-only version).
10. **quadEOM.m**: Complete quadcopter equations of motion.
11. **quad_pos.m**: Utility to update quadcopter's position.
12. **plot_state.m**: Plots the state of the quadcopter.
13. **init_state.m**: Initializes the state of the quadcopter for simulation.

## Usage

1. Run `runsim.m` to start the quadcopter simulation. This script initializes the simulation environment.

2. Modify `controller.m` to implement or customize the control logic for the quadcopter's flight.

3. Use `traj_generator.m` to generate different types of trajectories for testing and evaluation.

4. The utility functions in the "utils" folder provide various functionalities such as state conversion and visualization. These functions are used by the main scripts for calculations and plotting.

5. `evaluate.p` can be used to assess the performance of the quadcopter's controller using different trajectory patterns.

## Requirements

- MATLAB environment (compatible with the version used to develop the project).
- Appropriate toolbox dependencies (if required by specific scripts).

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
