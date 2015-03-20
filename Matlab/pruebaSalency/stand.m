function matrixOut = stand(matrixIn)
matrixOut = (matrixIn - min(min(matrixIn)))*255/max(max(matrixIn));
end

