%m������ѡ��
n = 0;
pair = zeros(15,2);

m_test2 = [m;m_sample5;m_sample11;m_sample13;m_sample23;m_sample31];
indx = find(m_test2==1);
m_test2(indx) = -1;
indx = find(m_test2==0);
m_test2(indx) = 1;

for i=1:5
    for j=1:6-i
        temp_corr = abs(ycorr(m_test2(i,:),m_test2(i+j,:),63));%���㻥��غ���
        if(max(temp_corr)<=17)
           n = n+1;
           pair(n,:)=[i,(i+j)];
       end
    end
end

N=63;
t=1-N:1:N-1;
figure(3);
m_xcorr=ycorr(m_test2(1,:),m_test2(1,:),N)/N;
subplot(3,1,1);
plot(t,m_xcorr);
title('m���й�һ������غ���');
m_sample5_xcorr=ycorr(m_test2(2,:),m_test2(2,:),N)/N;
subplot(3,1,2);
plot(t,m_sample5_xcorr);
title('s=5ʱm���й�һ������غ���');
m_sample11_xcorr=ycorr(m_test2(3,:),m_test2(3,:),N)/N;
subplot(3,1,3);
plot(t,m_sample11_xcorr);
title('s=11ʱm���й�һ������غ���');
figure(4);
m_sample13_xcorr=ycorr(m_test2(4,:),m_test2(4,:),N)/N;
subplot(3,1,1);
plot(t,m_sample13_xcorr);
title('s=13ʱm���й�һ������غ���');
m_sample23_xcorr=ycorr(m_test2(5,:),m_test2(5,:),N)/N;
subplot(3,1,2);
plot(t,m_sample23_xcorr);
title('s=23ʱm���й�һ������غ���');
m_sample31_xcorr=ycorr(m_test2(6,:),m_test2(6,:),N)/N;
subplot(3,1,3);
plot(t,m_sample31_xcorr);
title('s=31ʱm���й�һ������غ���');
% 
% 
m_xcorr1_2=ycorr(m_test2(1,:),m_test2(2,:),N)/N;
m_xcorr1_4=ycorr(m_test2(1,:),m_test2(4,:),N)/N;
m_xcorr1_6=ycorr(m_test2(1,:),m_test2(6,:),N)/N;
m_xcorr2_3=ycorr(m_test2(2,:),m_test2(3,:),N)/N;
m_xcorr2_5=ycorr(m_test2(2,:),m_test2(5,:),N)/N;
m_xcorr3_4=ycorr(m_test2(3,:),m_test2(4,:),N)/N;
m_xcorr3_6=ycorr(m_test2(3,:),m_test2(6,:),N)/N;
m_xcorr4_5=ycorr(m_test2(4,:),m_test2(5,:),N)/N;
m_xcorr5_6=ycorr(m_test2(5,:),m_test2(6,:),N)/N;
figure(5);
subplot(3,1,1);
plot(t,m_xcorr1_2);
title('��һ��m������ѡ�ԵĻ���غ���');
legend('��s=1��s=5���');
subplot(3,1,2);
plot(t,m_xcorr1_4);
title('�ڶ���m������ѡ�ԵĻ���غ���');
legend('��s=1��s=13���');
subplot(3,1,3);
plot(t,m_xcorr1_6);
title('������m������ѡ�ԵĻ���غ���');
legend('��s=1��s=31���');
figure(6);
subplot(3,1,1);
plot(t,m_xcorr2_3);
title('���Ķ�m������ѡ�ԵĻ���غ���');
legend('��s=5��s=11���');
subplot(3,1,2);
plot(t,m_xcorr2_5);
title('�����m������ѡ�ԵĻ���غ���');
legend('��s=5��s=23���');
subplot(3,1,3);
plot(t,m_xcorr3_4);
title('������m������ѡ�ԵĻ���غ���');
legend('��s=11��s=13���');
figure(7);
subplot(3,1,1);
plot(t,m_xcorr3_6);
title('���߶�m������ѡ�ԵĻ���غ���');
legend('��s=11��s=31���');
subplot(3,1,2);
plot(t,m_xcorr4_5);
title('�ڰ˶�m������ѡ�ԵĻ���غ���');
legend('��s=13��s=23���');
subplot(3,1,3);
plot(t,m_xcorr5_6);
title('�ھŶ�m������ѡ�ԵĻ���غ���');
legend('��s=23��s=31���');