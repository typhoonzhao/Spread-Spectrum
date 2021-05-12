% Created on Tues Apr  6 09:13:40 2021
% @author: �Ŵ���1170500622@stu.hit.edu.cn��

function out = get_kasami_long(m_kasami,m_long,m_short,T)
% �������ܣ����������m��������kasami��
% ----------
% ���������
% ----------
% m_kasami : һά��������
%     �ϳ���m����
% m_long : һά��������
%     �ϳ�m���е���ѡ��
% m_short : һά��������
%     �϶̵�m����
% T : ����
%     �ϳ�m���е����ڣ�Ҳ��kasami�󼯵�����
% ����ֵ��
% -------
% out : һά��������
%     �������ɵ�kasamiС�����У�ÿһ����һ����
% ����ʱ�䣺2021/4/6�����������إ��

gold = zeros(T+2,T);%��ʼ��gold����
out = zeros((T+2)*sqrt(T+1),T);%��ʼ��kasami������
cnt = 0;%��ʼ��kasami�����е�����
for jj = 1:1:length(m_long)%��ʼ����gold����
    gold(jj,:) = bitxor(m_kasami,circshift(m_long,-jj));%����m������λ���
end%ǰ63��gold�����������
gold(T+1,:) = m_kasami;%������gold���о���m����
gold(T+2,:) = m_long;
for kk = 1:1:size(gold,1)%����ÿһ��gold�����ٺͶ̵�m�������
    for jj = 1:1:length(m_short)%���ڶ̵�m����
        cnt = cnt + 1;%������Ҫ����ˣ��ȰѴ�������1
        real_m_short = zeros(1,T);%׼���ö��������������
        for ii = 1:1:T/length(m_short)%һ��������ô�������
            real_m_short((ii-1)*length(m_short)+1:ii*length(m_short)) = circshift(m_short,-jj);%��ƽ�ƣ�������
        end%�������
        out(cnt,:) = bitxor(gold(kk,:),real_m_short);%�������gold���кͶ�m���еļӺ�
    end%ǰ7��������
    cnt = cnt + 1;%���һ����Ҫ����
    out(cnt,:) = gold(kk,:);%���һ��kasami���о��Ǳ�gold����
end%�������е�gold���ж��ѺͶ�m�������
end