import matlab.engine 

eng = matlab.engine.start_matlab() 

t = eng.isprime(37)

print(t)