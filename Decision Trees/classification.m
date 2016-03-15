function target_values = classification(target_values)

for index = 1:length(target_values)
    if(target_values([index]) > 1400)
        target_values([index]) = 1;
    else
        target_values([index]) = 0;        
    end   
    
end
      
        
