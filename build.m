%% Automatically Generated Run Script
failed=0;
try
    fprintf('########## Started ##########\n');
    
    fprintf('########## Jenkins Environment ##########\n');
    for jenkins_var = {'BUILD_NUMBER', 'BUILD_ID', 'BUILD_URL', 'NODE_NAME', 'JOB_NAME', 'BUILD_TAG', 'JENKINS_URL', 'EXECUTOR_NUMBER', 'JAVA_HOME', 'WORKSPACE', 'GIT_COMMIT', 'GIT_URL', 'GIT_BRANCH'}
        fprintf('%% %s: %s\n',jenkins_var{1}, getenv(jenkins_var{1}));
    end
    
    
    fprintf('########## Build Process ##########\n');
    % restoredefaultpath;
    disp('% TODO: Build Stuff')
catch me
    fprintf('########## Failed ##########\n');
    fprintf('ERROR: %s (%s)\n\n',me.message, me.identifier)
    for i = numel(me.stack):-1:1
        fprintf('[Line %02d]: %s\n',me.stack(i).line,me.stack(i).file)
    end
    failed=1;
end
fprintf('########## Finished ##########\n');
if ~isempty(getenv('WORKSPACE'))
    % Only exit running under Jenkins.
    exit(failed);
end