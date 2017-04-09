imgp=input("图片文件名?","s");
img=imread(imgp);
img2=img(y1:y2,x1:x2,1:3);
figure;
imshow(img2);
img2r=img2(:,:,1);
img2g=img2(:,:,2);
img2b=img2(:,:,3);
imgarrr=zeros(size(img2,2));
imgarrg=imgarrr;
imgarrb=imgarrr;
for i=1:size(img2,2)
imgarrr(i)=sum(img2r(:,i))/size(img2,1);
imgarrg(i)=sum(img2g(:,i))/size(img2,1);
imgarrb(i)=sum(img2b(:,i))/size(img2,1);
end
figure;
plot(y,imgarrr+imgarrg+imgarrb)

