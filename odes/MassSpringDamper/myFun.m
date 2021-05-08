function myFun()
persistent myVar
if isempty(myVar)
    myVar = 0;
end
myVar = myVar + 1;
end