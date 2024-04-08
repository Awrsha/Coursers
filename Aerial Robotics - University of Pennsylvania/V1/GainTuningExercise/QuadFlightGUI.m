classdef QuadFlightGUI < matlab.apps.AppBase

    % Properties
    properties
        
        quadPlot;
        flightTimer;
        
        kpEdit;
        kiEdit;
        kdEdit;
        
    end

    % Callbacks
    methods (Access = private)

        % Constructor
        function app = QuadFlightGUI()
            
            % Create Figure
            app.Figure = uifigure;
            
            % PID gains inputs
            app.kpEdit = uieditfield(app.Figure, 'numeric');
            app.kiEdit = uieditfield(app.Figure, 'numeric');
            app.kdEdit = uieditfield(app.Figure, 'numeric');
            
            % Start button
            startButton = uibutton(app.Figure, 'push', 'Text', 'Start', ...
                'ButtonPushedFcn', @(app,event) startSimulation(app));
            
            % 3D plot
            app.quadPlot = Axes3D(app.Figure);
            
        end

        % Start simulation
        function startSimulation(app)
            
            kp = app.kpEdit.Value;
            ki = app.kiEdit.Value;
            kd = app.kdEdit.Value;
            
            app.flightTimer = timer;
            set(app.flightTimer, 'StartDelay', 0);
            set(app.flightTimer, 'Period', 0.01); 
            set(app.flightTimer, 'TasksToExecute', 100);
            set(app.flightTimer, 'ExecutionMode', 'fixedRate');  
            
            % Start simulation
            start(app.flightTimer);
            
            % Update plot periodically
            set(app.flightTimer, 'TimerFcn', @(x,y) updatePlot(app)); 
            
        end

        % Update plot 
        function updatePlot(app)
          
            % Get current state 
            state = getQuadState();
            
            % Update plot
            app.quadPlot.updatePlot(state);
            
        end

    end
end