function save_some_data_parallel


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
subjobid = getenv('SLURM_ARRAY_TASK_ID');
filename = sprintf('data%d.mat', subjobid);
save(filename, 'data');









