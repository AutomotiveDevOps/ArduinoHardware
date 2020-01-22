%% Automatically Generated Run Script
failed=0;
try
    profile('on'); % Start profiling.
    
    % Log Messages
    fprintf('########## Started ##########\n');
    fprintf('########## Jenkins Environment ##########\n');
    % Print all Jenkins Variables.
    for jenkins_var = {'BUILD_NUMBER', 'BUILD_ID', 'BUILD_URL', 'NODE_NAME', 'JOB_NAME', 'BUILD_TAG', 'JENKINS_URL', 'EXECUTOR_NUMBER', 'JAVA_HOME', 'WORKSPACE', 'GIT_COMMIT', 'GIT_URL', 'GIT_BRANCH'}
        fprintf('%% %s: %s\n',jenkins_var{1}, getenv(jenkins_var{1}));
    end
    % Start build process.
    fprintf('########## Build Process ##########\n');
    % restoredefaultpath;
    buildArduinoTemplates;
catch me
    % Dump the full stack for debugging.
    fprintf('########## Failed ##########\n');
    fprintf('ERROR: %s (%s)\n\n',me.message, me.identifier)
    for i = numel(me.stack):-1:1
        fprintf('[Line %02d]: %s\n',me.stack(i).line,me.stack(i).file)
    end
    failed=1;
end
fprintf('########## Finished ##########\n');
% Save profiling results.
profsave(profile('info'),'profile_results')
if ~isempty(getenv('WORKSPACE'))
    % Only exit running under Jenkins.
    exit(failed);
end