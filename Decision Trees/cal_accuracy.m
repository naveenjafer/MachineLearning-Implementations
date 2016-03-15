function accuracy = cal_accuracy(predicted, target)
count = 0;

for index = 1:length(predicted)
    if(predicted(index) == target(index))
        count = count + 1;
    end
end
   
accuracy = count/length(predicted);