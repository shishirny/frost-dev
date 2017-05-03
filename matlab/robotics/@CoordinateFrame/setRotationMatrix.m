function obj = setRotationMatrix(obj,r)
    % set the rotation matrix (R) of the frame w.r.t to the
    % reference frame
    %
    % Parameters:
    % r: the rotation matrix or Euler angles (in radian) @type
    % rowvec|matrix
    
    if isvector(r) && length(r) == 3
        rpy = rad2deg(r);
        obj.R = rotz(rpy(3)) * roty(rpy(2)) * rotx(rpy(1));
    elseif all(size(r)==[3,3])
        assert(abs(det(r))==1,...
            'The determinant of the rotation matrix must equal 1.');
        obj.R = r;
    end
    
    % update the homogeneous transformation matrix
    obj.computeHomogeneousTransform();
end

function R = rotx(alpha)
%rotz  rotate around X by ALPHA
%
%	R = rotx(alpha)
%
% See also: roty, rotz
% Author: Jake Reher: jreher@caltech.edu

R = [1 0 0; ...
     0 cos(alpha) -sin(alpha); ...
     0 sin(alpha)  cos(alpha)];
          
end

function R = roty(alpha)
%roty  rotate around Y by ALPHA
%
%	R = roty(alpha)
%
% See also: rotx, rotz
% Author: Jake Reher: jreher@caltech.edu

R = [cos(alpha)  0 sin(alpha); ...
             0   1          0; ...
    -sin(alpha)  0 cos(alpha)];
          
end

function R = rotz(alpha)
%rotz  rotate around Z by ALPHA
%
%	R = rotz(alpha)
%
% See also: ROTX, ROTY, ROT, POS.
% Author: Jake Reher: jreher@caltech.edus

R = [cos(alpha) -sin(alpha) 0; ...
     sin(alpha)  cos(alpha) 0; ...
              0           0 1];

end