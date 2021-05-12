%m����
close all

a=[1 0 0 0 0 0 0];%��λ�Ĵ�����ʼ״̬
m=zeros(1,63);
for i=1:63
    m(i)=xor(a(6),a(1));
    a(6)=a(5);
    a(5)=a(4);
    a(4)=a(3);
    a(3)=a(2);
    a(2)=a(1);
    a(1)=m(i);
end

m_expand=[m m m m m m m m m m m m m m m m m m m m m m m m m m m m m m];
m_expand=[m_expand m_expand m_expand];
for i=1:63
    m_sample5(i)=m_expand((i-1)*5+1);
    m_sample11(i)=m_expand((i-1)*11+1);
    m_sample13(i)=m_expand((i-1)*13+1);
    m_sample23(i)=m_expand((i-1)*23+1);
    m_sample31(i)=m_expand((i-1)*31+1);
end
figure(1);
subplot(3,1,1);
stem(m);
title('m����');
subplot(3,1,2);
stem(m_sample5);
title('s=5ʱ�ĳ�ȡ���');
subplot(3,1,3);
stem(m_sample11);
title('s=11ʱ�ĳ�ȡ���');
figure(2);
subplot(3,1,1);
stem(m_sample13);
title('s=13ʱ�ĳ�ȡ���');
subplot(3,1,2);
stem(m_sample23);
title('s=23ʱ�ĳ�ȡ���');
subplot(3,1,3);
stem(m_sample31);
title('s=31ʱ�ĳ�ȡ���');
