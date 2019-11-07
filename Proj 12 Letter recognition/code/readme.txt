程序指南：
    1) 运行 main.m即可进行测试
    2) 输入图像('fox.JPG') 
    3) 识别出的字母输出在output.txt中，
        如果多次运行程序，每次运行后的结果接在output.txt已有结果后面 
    4) 可输入其他图片，更改'fox.JPG'即可.


文件夹说明：

code: 
    主函数——main.m
    训练函数 ——train.m 已经训练好，训练结果保存为net.mat
    子函数，实现图像预处理——line_classifier.m 、lines.m、testit.m
    子函数，实现图像特征提取——feature_extract.m
    
code/training_set :
     A~Z，26个字母的图片训练集


	
