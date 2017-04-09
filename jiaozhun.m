disp("输入图像请注意谱线要平行与图片垂直方向，左蓝右红。。")
disp("校准波长轴。。请使用连续光谱(例如钨丝白炽灯)")
disp("注意请保持其他图片与校准图片拍摄位置完全一致。。例如用胶将相机粘在分光仪上")
imgp=input("校准用图片?","s");
img=imread(imgp);
figure;
disp("确定图片剪裁位置。。注意剪裁只保留光谱。。避免干扰。。")
imshow(img)
axis on
x1=input("x开始");
x2=input("x结束");
y1=input("y开始");
y2=input("y结束");
img2=img(y1:y2,x1:x2,1:3);
img2r=img2(:,:,1);
img2g=img2(:,:,2);
img2b=img2(:,:,3);
imgarrr=zeros(size(img2,2));
imgarrg=imgarrr;
imgarrb=imgarrr;
all=imgarrr;
for i=1:size(img2,2)
imgarrr(i)=sum(img2r(:,i))/size(img2,1);
imgarrg(i)=sum(img2g(:,i))/size(img2,1);
imgarrb(i)=sum(img2b(:,i))/size(img2,1);
all(i)=imgarrr(i)+imgarrg(i)+imgarrb(i);
end
figure;
hold on
plot(imgarrr,"r");
plot(imgarrg,"g");
plot(imgarrb,"b");
hold off
rm=0;
gm=0;
bm=0;
ri=0;
gi=0;
bi=0;
for i=1+1:size(img2,2)-1
if sum(imgarrr(i-1:i+1))/(3*1)>rm
rm=sum(imgarrr(i-1:i+1))/(3*1);
ri=i;
end
if sum(imgarrg(i-1:i+1))/(3*1)>gm
gm=sum(imgarrg(i-1:i+1))/(3*1);
gi=i;
end
if sum(imgarrb(i-1:i+1))/(3*1)>bm
bm=sum(imgarrb(i-1:i+1))/(3*1);
bi=i;
end
end
yy=[419,531,559];
xx=[bi,gi,ri];
disp(xx)
s=polyfit(xx,yy,1);
disp(s)
x=1:size(img2,2);
y=s(1)*x+s(2);
figure;
plot(y,imgarrr+imgarrg+imgarrb)
disp("波长轴校准完成");

