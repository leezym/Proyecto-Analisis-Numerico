import matlab.engine
import os
from PIL import Image


eng = matlab.engine.start_matlab()
eng.desktop(nargout=0) #  returns the number of output arguments specified for a function.
px = eng.linspace(0.0,6.28,3) #Crea el array
eng.workspace['mx'] = px #Lo carga en el workspace
x = [2,4,6,7]
ax = matlab.double([2,3,4,5,6])
eng.workspace['mr'] = ax

eng.eval('x = mx;',nargout=0)
mpi = eng.workspace['x']
print(mpi)

eng.eval('b = mr;',nargout=0)
mpi2 = eng.workspace['b']
print(mpi2)

#https://la.mathworks.com/help/matlab/apiref/matlab.engine.matlabengine-class.html
#https://la.mathworks.com/help/matlab/matlab_external/use-matlab-arrays-in-python.html
#https://la.mathworks.com/help/matlab/matlab_external/pass-data-to-matlab-from-python.html
#https://la.mathworks.com/help/matlab/matlab_external/passing-data-to-python.html
#https://la.mathworks.com/help/matlab/matlab_external/python-function-arguments.html
#https://la.mathworks.com/help/matlab/apiref/matlab.engine.start_matlab.html
