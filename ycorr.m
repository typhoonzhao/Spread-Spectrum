function y=ycorr(u,v,N)
%u,v�ֱ�Ϊ�������У�NΪ���г��ȣ�������ߵȳ�
%m���е�����غͻ���ز���ֱ����xcorr������ʵ�֣���Ҫ������һ��������λȻ�����
%��Ϊ�ڽ����������֮ǰ��0��Ϊ1��1��Ϊ-1��������ʵ����ģ����
%1*1=1��������0��ģ���ͣ����Ϊ0
%1*-1=-1����1��0��ģ���ͣ����Ϊ1
%-1*-1=1��������1��ģ���ͣ����Ϊ0
for i=0:N
    u1=[u(i+1:N) u(1:i)];%��ʾu��������
    temp1(N+1-i)=sum(u1.*v);
    u2=[u(N-i+1:N) u(1:N-i)];%��ʾu��������
    temp2(i+1)=sum(u2.*v);
end
y=[temp1(2:N) temp2(1:N)];