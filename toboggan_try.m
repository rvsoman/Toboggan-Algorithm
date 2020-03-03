clc;clear;close all;
grad=[[12 14 23 13];[16 11 21 18];[21 24 23 12];[12 21 20 10]];
img=[[4 4 3 2];[3 7 6 1];[2 7 6 2];[0 1 0 2]];
grad1=padarray(grad,[1,1],999);
[row,col]=size(img);
final=zeros(row,col);
c=zeros(9,0);
x=999;
r=1;
cl=1;
for ii=2:row+1
    for jj=2:col+1
       c(1)=grad1(ii-1,jj-1);
       if x> c(1)
           x=c(1);
           r=ii-1;
           cl=jj-1;
       end
           
       c(2)=grad1(ii-1,jj);
       if x> c(2)
           x=c(2);
           r=ii-1;
           cl=jj;
       end
       c(3)=grad1(ii-1,jj+1);
       if x> c(3)
           x=c(3);
           r=ii-1;
           cl=jj+1;
       end
       c(4)=grad1(ii,jj-1);
       if x> c(4)
           x=c(4);
           r=ii;
           cl=jj-1;
       end
       c(5)=grad1(ii,jj);
       if x> c(5)
           x=c(5);
           r=ii;
           cl=jj;
       end
       c(6)=grad1(ii,jj+1);
       if x> c(6)
           x=c(6);
           r=ii;
           cl=jj+1;
       end
       c(7)=grad1(ii+1,jj-1);
       if x> c(7)
           x=c(7);
           r=ii+1;
           cl=jj-1;
       end
       c(8)=grad1(ii+1,jj);
       if x> c(8)
           x=c(8);
           r=ii+1;
           cl=jj;
       end
       c(9)=grad1(ii+1,jj+1);
       if x> c(9)
           x=c(9);
           r=ii+1;
           cl=jj+1;
       end
        
        final(ii-1,jj-1)=img(r-1,cl-1);
        
    end
end







