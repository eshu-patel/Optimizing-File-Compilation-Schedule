function F = compilable_check(finished_files,dependencies)

dependencies = str2num(dependencies);
if length((dependencies)) == 0
    F = 1;
else
    dependencies;
    check = ismember(dependencies,finished_files);
    F  = (sum(check) == length(dependencies));
end

end
