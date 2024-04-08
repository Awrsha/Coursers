classdef PIDController < handle
    %PIDCONTROLLER PID control for quadrotor
    
    properties
        kp
        ki
        kd
        
        e_integ
        e_prev
        
        u_sat
        u_min
        u_max
    end
    
    methods
        function obj = PIDController(kp, ki, kd, u_sat, u_min, u_max)
            % Constructor
            if nargin > 0
                obj.kp = kp;
                obj.ki = ki;
                obj.kd = kd;
                
                obj.u_sat = u_sat; 
                obj.u_min = u_min;
                obj.u_max = u_max;
            end

            obj.e_integ = 0;
            obj.e_prev = 0;
        end
        
        function u = run(obj, y_ref, y)
            % Run one step of PID control
            
            error = y_ref - y;
            
            P = obj.kp * error;
            
            obj.e_integ = obj.e_integ + error;
            I = obj.ki * obj.e_integ;
            
            D = obj.kd * (error - obj.e_prev);
            
            u = P + I + D;
            
            % Saturate
            if abs(u) > obj.u_sat
                u = sign(u) * obj.u_sat;
            end
            
            % Anti-wind up
            if u >= obj.u_max
               u = obj.u_max; 
               obj.e_integ = obj.e_integ - error;
            elseif u <= obj.u_min
               u = obj.u_min;
               obj.e_integ = obj.e_integ - error; 
            end
            
            obj.e_prev = error;           
        end
        
    end
end