function obj = setHolonomicConstraints(obj, constraints)
    % setDomainConstraints - configure holonomic constraints of domain
    %
    
    % argument check
    narginchk(2,2);
    
    %     obj.holConstrName  = constraints;
    obj.dim_hol_constrs   = numel(constraints);
    
    
    % check existance of mex files
%     assert(exist(strcat('hol_',obj.name),'file')==3,...
%         'The MEX file could not be found: %s\n',...
%         strcat('hol_',obj.name)); % 3 - Mex-file
%     assert(exist(strcat('Jhol_',obj.name),'file')==3,...
%         'The MEX file could not be found: %s\n',...
%         strcat('Jhol_',obj.name)); % 3 - Mex-file
%     assert(exist(strcat('dJhol_',obj.name),'file')==3,...
%         'The MEX file could not be found: %s\n',...
%         strcat('dJhol_',obj.name)); % 3 - Mex-file
    
    obj.hol_constr_func = str2func(strcat('hol_',obj.name));
    obj.hol_constr_jac = str2func(strcat('Jhol_',obj.name));
    obj.hol_constr_jacdot = str2func(strcat('dJhol_',obj.name));
    
           

end