function [ output ] = ApplyLaplacian( input )
   
   output = input;
   
   [rows, columns] = size(input);

    for r=1:rows - 3;
        for c=1:columns - 3;
            output(r,c) = (0)  * input(r, c)     + (-1) * input(r, c + 1)     + (0)  * input(r, c + 2) + ...
                          (-1) * input(r + 1, c) + (5)  * input(r + 1, c + 1) + (-1) * input(r + 1, c + 2) + ...
                          (0)  * input(r + 2, c) + (-1) * input(r + 2, c + 1) + (0)  * input(r + 2, c + 2);
        end
    end
end