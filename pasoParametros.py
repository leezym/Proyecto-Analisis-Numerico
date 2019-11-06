import matlab.engine
import os
from PIL import Image


eng = matlab.engine.start_matlab()

eng.desktop(nargout=0)
px = eng.linspace(0.0,6.28,1000) #Crea el array
eng.workspace['mx'] = px #Lo carga en el workspace

#https://la.mathworks.com/help/matlab/apiref/matlab.engine.matlabengine-class.html
