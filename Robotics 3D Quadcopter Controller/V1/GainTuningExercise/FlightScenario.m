classdef FlightScenario
    %FLIGHTSCENARIO Generate desired trajectory
    
    properties
        t_start
        t_end
        
        x_start
        x_end
        
        y_start 
        y_end
        
        z_start
        z_end
    end
    
    methods
        function obj = FlightScenario()
            % Constructor
            
            % Set default values
            obj.t_start = 0;
            obj.t_end = 10;
            
            obj.x_start = 0;
            obj.x_end = 5;
            
            obj.y_start = 0;
            obj.y_end = 5;
            
            obj.z_start = 2;
            obj.z_end = 2;
        end
        
        function [x_ref, y_ref, z_ref] = getDesiredState(obj, t)
           % Calculate desired state at time t
           
           x_ref = obj.x_start + (obj.x_end - obj.x_start) * (t - obj.t_start) / (obj.t_end - obj.t_start);
           y_ref = obj.y_start + (obj.y_end - obj.y_start) * (t - obj.t_start) / (obj.t_end - obj.t_start);
           z_ref = obj.z_start + (obj.z_end - obj.z_start) * (t - obj.t_start) / (obj.t_end - obj.t_start);           
        end       
        
    end
    
end