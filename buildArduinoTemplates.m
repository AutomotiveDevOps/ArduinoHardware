function buildArduinoTemplates(varargin)
bdclose('all');
load_system('simulink')
mkdir('build')
cd('build');

%% Build Templates
template_base = 'arduino_BasicModel.sltx';
template_directory = fileparts(which(template_base));
templates = dir(fullfile(template_directory, '*.sltx'));
%% Build Examples
% Model name to search fore.
example_base = 'arduino_wifi';
% Find the template directory.
example_directory = fileparts(which(example_base));
% Find all of the example models.
examples = dir(fullfile(example_directory, '*.slx'));
%%
% for template in templates:
for template = [templates;examples]'
    [~, model] = fileparts(template.name);
    if strfind(model, 'MATLAB')
        % Not working on arduino_MATLAB_IO_Codegen
        continue
    end
    %
    hdl = Simulink.createFromTemplate(model);
    %
    cs = getActiveConfigSet(hdl);
    cs.set_param('GenCodeOnly', 'on');   % Generate code only
    % Save the system
    save_system(hdl, sprintf('%s_%s', model, 'ci'));
    % Build
    slbuild(hdl);
    % cs.buildRTW;
    
    % Save the system and close it.
    save_system(hdl);
    close_system(hdl);
end
