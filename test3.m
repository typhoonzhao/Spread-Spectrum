%Gold����
%����6�ԣ�����6��Gold���У�ȡ��һ��m����
Gold=zeros(N+2,N);
Gold(1,:)=m;
Gold(2,:)=m_sample5;
for i=1:N
    if(i ~= N)
        temp_m_sample5(1:N-i)=m_sample5(i+1:N);
        temp_m_sample5(N-i+1:N)=m_sample5(1:i);
    end
    if(i == N)
        temp_m_sample5=m_sample5;
    end
%          for j=1:N
%              temp_m_sample5(j)=m_sample5(mod(j-1+i,63)+1);
%          end
    Gold(i+2,:)=xor(m,temp_m_sample5);
end
% indx=find(Gold == 1);
% Gold(indx) = -1;
% indx=find(Gold == 0);
% Gold(indx) = 1;

Gold_xcorr10=ycorr(Gold(10,:),Gold(10,:),N);
Gold_xcorr20=ycorr(Gold(20,:),Gold(20,:),N);
Gold_xcorr10_20=ycorr(Gold(10,:),Gold(20,:),N);%��10�к͵�20��
figure(8);
subplot(3,1,1);
plot(t,Gold_xcorr10);
title('��10��Gold���е�����غ���');
subplot(3,1,2);
plot(t,Gold_xcorr20);
title('��20��Gold���е�����غ���');
subplot(3,1,3);
plot(t,Gold_xcorr10_20);
title('��10���͵�20��Gold���еĻ���غ���');

Gold_xcorr30=ycorr(Gold(30,:),Gold(30,:),N);
Gold_xcorr40=ycorr(Gold(40,:),Gold(40,:),N);
Gold_xcorr30_40=ycorr(Gold(30,:),Gold(40,:),N);%��30�к͵�40��
figure(9);
subplot(3,1,1);
plot(t,Gold_xcorr30);
title('��30��Gold���е�����غ���');
subplot(3,1,2);
plot(t,Gold_xcorr40);
title('��40��Gold���е�����غ���');
subplot(3,1,3);
plot(t,Gold_xcorr30_40);
title('��30���͵�40��Gold���еĻ���غ���');

Gold_xcorr50=ycorr(Gold(50,:),Gold(50,:),N);
Gold_xcorr60=ycorr(Gold(60,:),Gold(60,:),N);
Gold_xcorr50_60=ycorr(Gold(50,:),Gold(60,:),N);%��50�к͵�60��
figure(10);
subplot(3,1,1);
plot(t,Gold_xcorr50);
title('��50��Gold���е�����غ���');
subplot(3,1,2);
plot(t,Gold_xcorr60);
title('��60��Gold���е�����غ���');
subplot(3,1,3);
plot(t,Gold_xcorr50_60);
title('��50���͵�60��Gold���еĻ���غ���');

