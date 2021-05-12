%Kasami小集序列
a=[1 0 0 0 0 0];
N=63;
t=1-N:N-1;
kasami=zeros(1,N);
m_kasami=zeros(1,700);
for i=1:700
    m_kasami(i)=mod(a(6)+a(5)+a(2)+a(1),2);
    a(6)=a(5);
    a(5)=a(4);
    a(4)=a(3);
    a(3)=a(2);
    a(2)=a(1);
    a(1)=m_kasami(i);
end
 for i=1:63
     v(i)=m_kasami((i-1)*9+1);
 end
 
 kasami(1,:)=m_kasami(1:63);
 for i=0:6
     if(i~=0)
         temp_v(1:63-i)=v(i+1:63);
         temp_v(63-i+1:63)=v(1:i);
     end
     if(i == 0)
         temp_v=v;
     end
     kasami(i+2,:)=xor(m_kasami(1:63),temp_v);
 end
 
 kasami_xcorr1=ycorr(kasami(1,:),kasami(1,:),N);
 kasami_xcorr2=ycorr(kasami(2,:),kasami(2,:),N);
 kasami_xcorr1_2=ycorr(kasami(1,:),kasami(2,:),N);
 figure(1);
 subplot(311);
 plot(t,kasami_xcorr1);
 title('第1个kasami序列的自相关函数');
 subplot(312);
 plot(t,kasami_xcorr2);
 title('第2个kasami序列的自相关函数');
 subplot(313);
 plot(t,kasami_xcorr1_2);
 title('第1个和第2个kasami序列的互相关函数');
 
 kasami_xcorr3=ycorr(kasami(3,:),kasami(3,:),N);
 kasami_xcorr4=ycorr(kasami(4,:),kasami(4,:),N);
 kasami_xcorr3_4=ycorr(kasami(3,:),kasami(4,:),N);
 figure(2);
 subplot(311);
 plot(t,kasami_xcorr3);
 title('第3个kasami序列的自相关函数');
 subplot(312);
 plot(t,kasami_xcorr4);
 title('第4个kasami序列的自相关函数');
 subplot(313);
 plot(t,kasami_xcorr3_4);
 title('第3个和第4个kasami序列的互相关函数');
 
 kasami_xcorr5=ycorr(kasami(5,:),kasami(5,:),N);
 kasami_xcorr6=ycorr(kasami(6,:),kasami(6,:),N);
 kasami_xcorr5_6=ycorr(kasami(5,:),kasami(6,:),N);
 figure(3);
 subplot(311);
 plot(t,kasami_xcorr5);
 title('第5个kasami序列的自相关函数');
 subplot(312);
 plot(t,kasami_xcorr6);
 title('第6个kasami序列的自相关函数');
 subplot(313);
 plot(t,kasami_xcorr5_6);
 title('第5个和第6个kasami序列的互相关函数');
 