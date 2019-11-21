function save_some_data_parallel

job_id = getenv('SLURM_JOBID');
array_id = getenv('SLURM_ARRAY_TASK_ID');
fprintf('job %d array %d\n', job_id, array_id);
ver matlab


%% Initialize parallel pool
tmpdir = tempname;
mkdir(tmpdir);
pc = parcluster();
pc.JobStorageLocation = tmpdir;
n = feature('numCores');
parpool(pc, n);

%% Generate some data
data = cell(1, n);
parfor i = 1:n
    data{i} = rand(100); %#ok<PFOUS>
end

%% Save the data
filename = sprintf('data%d.mat', array_id);
fprintf('Saving data to %s\n', filename);
save(filename, 'data');









