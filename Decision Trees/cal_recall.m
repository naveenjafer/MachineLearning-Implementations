function recall = recall(predicted, target)

tp = 0;
fn = 0;

for index = 1:length(predicted)
    if(target([index]) == 1 && predicted([index]) == target([index]))
        tp = tp + 1;
    elseif (target([index]) == 0 && predicted([index]) ~= target([index]))
        fn = fn + 1;
    end
    
    recall = tp/(tp+fn);
    
end
