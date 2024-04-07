classdef QuadDynamics < handle
    %QUADDYNAMICS  Model the dynamics of quadrotor flight
    
    properties
        m;  % Mass of quadrotor  
        L;  % Length of quadrotor arm
        g = 9.81;  % Gravitational acceleration constant
        Ixx; % Moment of inertia about x-axis
        Iyy; % Moment of inertia about y-axis
        Izz; % Moment of inertia about z-axis
        
        rotor_F; % Thrust force produced by each rotor
        rotor_M; % Torque produced by each rotor
        
        state; % Current state of the quadrotor [x y z xdot ydot zdot q0 q1 q2 q3 p q r]
        input; % Current control inputs [rotor speeds]
    end
    
    methods
        
        % Constructor
        function obj = QuadDynamics(m, L, Ixx, Iyy, Izz, rotor_F, rotor_M)
            
            % Set properties
            obj.m = m; 
            obj.L = L;
            obj.Ixx = Ixx;
            obj.Iyy = Iyy;
            obj.Izz = Izz;
            
            obj.rotor_F = rotor_F;
            obj.rotor_M = rotor_M;
            
            % Initialize state
            obj.state = [0; 0; 0; 0; 0; 0; 1; 0; 0; 0];
            
        end
        
        % Calculate net forces and torques
        function forces = calcForcesTorques(obj, rotorSpeeds)
            
            % Set force in x,y direction to 0 
            forces(1) = 0; 
            forces(2) = 0;
            
            % Calculate total thrust force in z direction
            forces(3) = sum(rotorSpeeds.^2) * obj.rotor_F;  
            
            % Calculate body torques
            torques(1) = ...
                obj.L * ( obj.rotor_M * (rotorSpeeds(1)^2 - rotorSpeeds(3)^2) ...
                + obj.rotor_F * (rotorSpeeds(1) - rotorSpeeds(3)));
            
            torques(2) = ...
                obj.L * ( obj.rotor_M * (rotorSpeeds(2)^2 - rotorSpeeds(4)^2) ... 
                + obj.rotor_F * (rotorSpeeds(2) - rotorSpeeds(4)));
            
            torques(3) = ...
                obj.rotor_M * (rotorSpeeds(1)^2 + rotorSpeeds(3)^2 ...
                - rotorSpeeds(2)^2 - rotorSpeeds(4)^2);
                   
        end
        
        % Calculate state derivatives
        function dState = calcDerivatives(obj, state, rotorSpeeds)
            
            % Get forces and torques
            [forces, torques] = obj.calcForcesTorques(rotorSpeeds);
            
            % Extract state
            pos = state(1:3);
            vel = state(4:6);
            q = state(7:10);
            omega = state(11:13);
            
            % Position derivatives
            dPos = vel;
            
            % Velocity derivatives
            acc = forces ./ obj.m;
            dVel = acc - [0; 0; obj.g];
            
            % Quaternion derivatives
            k = 1/2 * [0 -omega(1) -omega(2) -omega(3); ...
                      omega(1) 0 omega(3) -omega(2); ...
                      omega(2) -omega(3) 0 omega(1); ...
                      omega(3) omega(2) -omega(1) 0];
                  
            dq = 0.5*k*q;
            
            % Angular velocity derivatives
            I = [obj.Ixx, 0, 0; 0, obj.Iyy, 0; 0, 0, obj.Izz];
            dOmega = inv(I) * (torques - cross(omega, I*omega));
            
            % Assemble state derivative vector
            dState = [dPos; dVel; dq; dOmega];
            
        end
        
        % Integrate dynamics
        function state = integrate(obj, state0, inputs, dt)
            
            % Initialize state
            state = state0;
            
            % Loop through control inputs
            for i = 1:length(inputs)
                
                % Calculate derivatives
                dState = obj.calcDerivatives(state, inputs(i,:));
                
                % Integrate one timestep
                state = state + dState*dt;
                
            end
            
        end

    end
    
end