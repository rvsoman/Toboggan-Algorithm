clc; clear all; close all;
%grad=input('enter gradient matrix');
grad=[[12 14 23 13];[16 11 21 18];[21 24 23 12];[12 21 20 10]];
%I=input('enter iamge matrix');
I=[[4 4 3 2];[3 7 6 1];[2 7 6 2];[0 1 0 2]];
%pad the gradient matrix with a large number
new_grad = padarray(grad,[1 1],999);  
[rows_new_grad,cols_new_grad]=size(new_grad);

b=zeros(1,9);   
arr=[];
for j=2:cols_new_grad-1
    for i=2:rows_new_grad-1
        %get the neighbouring pixels for each pixel
        b(5)=new_grad(i-1,j-1); b(6)=new_grad(i-1,j); 
        b(7)=new_grad(i-1,j+1); b(4)=new_grad(i,j-1);
        b(8)=new_grad(i,j+1); b(3)=new_grad(i+1,j-1); 
        b(2)=new_grad(i+1,j); b(1)=new_grad(i+1,j+1);
        b(9)=new_grad(i,j);
        min_pixel=min(b);
        loc=find(b==min_pixel); %location of minimum pixel
        %get the locations of neighbouring pixels
        row_arr=[i+1 i+1 i+1 i i-1 i-1 i-1 i i];
        col_arr=[j+1 j j-1 j-1 j-1 j j+1 j+1 j];
        R=row_arr(loc);
        C=col_arr(loc);
        t=new_grad(row_arr(loc),col_arr(loc));
        im_t=I(row_arr(loc)-1,col_arr(loc)-1);
        arr=[arr im_t];
    end
end
final_mat=reshape(arr,[4,4]);  %final matrix
