% Created on Tues Apr  6 09:13:40 2021
% @author: 张传斌（1170500622@stu.hit.edu.cn）

function out = get_kasami_long(m_kasami,m_long,m_short,T)
% 函数功能：根据输入的m序列生成kasami大集
% ----------
% 输入参数：
% ----------
% m_kasami : 一维整型数组
%     较长的m序列
% m_long : 一维整型数组
%     较长m序列的优选对
% m_short : 一维整型数组
%     较短的m序列
% T : 整型
%     较长m序列的周期，也是kasami大集的周期
% 返回值：
% -------
% out : 一维整型数组
%     返回生成的kasami小集序列，每一行是一个大集
% 创建时间：2021/4/6，辛丑年二月廿五

gold = zeros(T+2,T);%初始化gold序列
out = zeros((T+2)*sqrt(T+1),T);%初始化kasami大集序列
cnt = 0;%初始化kasami大集序列的索引
for jj = 1:1:length(m_long)%开始生成gold序列
    gold(jj,:) = bitxor(m_kasami,circshift(m_long,-jj));%两个m序列移位相加
end%前63个gold序列生成完毕
gold(T+1,:) = m_kasami;%后两个gold序列就是m序列
gold(T+2,:) = m_long;
for kk = 1:1:size(gold,1)%对于每一个gold序列再和短的m序列相加
    for jj = 1:1:length(m_short)%对于短的m序列
        cnt = cnt + 1;%接下来要相加了，先把大集索引加1
        real_m_short = zeros(1,T);%准备好对其进行周期延拓
        for ii = 1:1:T/length(m_short)%一共延拓那么多个周期
            real_m_short((ii-1)*length(m_short)+1:ii*length(m_short)) = circshift(m_short,-jj);%先平移，后延拓
        end%延拓完毕
        out(cnt,:) = bitxor(gold(kk,:),real_m_short);%输出就是gold序列和短m序列的加和
    end%前7个输出完毕
    cnt = cnt + 1;%最后一个不要忘了
    out(cnt,:) = gold(kk,:);%最后一个kasami序列就是本gold序列
end%对于所有的gold序列都已和短m序列相加
end