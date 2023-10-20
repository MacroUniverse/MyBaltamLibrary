function shiftdim_test
% 1 arg
if ~isequal(size(shiftdim(zeros(1,3))), [3 1]), error('failed!'); end
if ~isequal(size(shiftdim(zeros(1,1,4))), [4 1]), error('failed!'); end
if ~isequal(size(shiftdim(zeros(1,1,1,5))), [5 1]), error('failed!'); end
if ~isequal(size(shiftdim(zeros(1,2,3))), [2 3]), error('failed!'); end
if ~isequal(size(shiftdim(zeros(1,1,2,3))), [2 3]), error('failed!'); end
if ~isequal(size(shiftdim(zeros(1,2,3,4))), [2 3 4]), error('failed!'); end
if ~isequal(size(shiftdim(zeros(1,1,2,3,4))), [2 3 4]), error('failed!'); end

% 2 args
if ~isequal(size(shiftdim(zeros(1,3),1)), [3 1]), error('failed!'); end
if ~isequal(size(shiftdim(zeros(1,3),2)), [1 3]), error('failed!'); end
if ~isequal(size(shiftdim(zeros(1,3),3)), [3 1]), error('failed!'); end

if ~isequal(size(shiftdim(zeros(2,3,4),1)), [3 4 2]), error('failed!'); end
if ~isequal(size(shiftdim(zeros(2,3,4),2)), [4 2 3]), error('failed!'); end
if ~isequal(size(shiftdim(zeros(2,3,4),3)), [2 3 4]), error('failed!'); end
if ~isequal(size(shiftdim(zeros(2,3,4),4)), [3 4 2]), error('failed!'); end
end
