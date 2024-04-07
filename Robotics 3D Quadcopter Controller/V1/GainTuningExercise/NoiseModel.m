classdef NoiseModel
    %NOISEMODEL Adds noise to sensor readings
    
    properties
        noise_gyro_stdev;  
        noise_accel_stdev;
        noise_sonar_stdev;
        
        rand_gauss;  
    end
    
    methods
        
        function obj = NoiseModel(noise_gyro_stdev, noise_accel_stdev, noise_sonar_stdev)
            % Constructor
            
            if nargin > 0
                obj.noise_gyro_stdev = noise_gyro_stdev;
                obj.noise_accel_stdev = noise_accel_stdev; 
                obj.noise_sonar_stdev = noise_sonar_stdev;
            end
            
            % Gaussian random number generator
            obj.rand_gauss = RandStream('mt19937ar','Seed',123);
            
        end
        
        function [gyro, accel, sonar] = generateNoise(obj, clean_data)
           
           % Add noise to gyroscope data
           gyro = clean_data.gyro + ...
               obj.rand_gauss.randn(3,1) * obj.noise_gyro_stdev;
           
           % Add noise to accelerometer data
           accel = clean_data.accel + ...
               obj.rand_gauss.randn(3,1) * obj.noise_accel_stdev;

           % Add noise to sonar data
           sonar = clean_data.sonar + ...
               obj.rand_gauss.randn(1,1) * obj.noise_sonar_stdev;
                   
        end
        
    end
    
end

%{

noise = NoiseModel(0.01, 0.1, 0.3);
while true
    ...
   
    clean_data = getSensorData();
    
    noisy_data = noise.generateNoise(clean_data);
    
    controller.control(noisy_data);
end
%}