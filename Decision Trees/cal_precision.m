function precision = precision(predicted, target)

tp = 0;
fp = 0;

for index = 1:length(predicted)
    if(target([index]) == 1 && predicted([index]) == target([index]))
        tp = tp + 1;
    elseif (target([index]) == 1 && predicted([index]) ~= target([index]))
        fp = fp + 1;
    end
    
    precision = tp/(tp+fp);
    
end
