# 选题四-视频对象擦除
成员与分工
- 夏厚 PB18051031 

  调研、部署环境、看paper
- 杨万钿 PB18071504

  调研

我对近几年众多的视频修复相关的论文，大致浏览了一遍abstract、introduction和related work，最终选定该项目。
这是MIT根据SiamMask 和 Deep-Video-Inpainting 两篇论文实现的一个视频对象擦除的项目。
- SiamMask是Fast Online Object Tracking and Segmentation: A Unifying Approach，论文提出了一个视频对象追踪和Mask的方法，实现了在第一帧手动框出想要跟踪的视频对象，并在整个视频中对齐进行跟踪定位和Mask。
- Deep-Video-Inpainting是一个以深度学习方法来解决视频修复的方法，论文能够实现随机区域修复（比如被mask掉的目标区域，随着帧在变化）和指定区域修复（比如水印和遮挡修复）。

该项目将SiamMask综合成一个mask函数，该函数将输入的视频第一帧以GUI的方式输出，用户手动框出想要抹去的对象，之后在视频的每一帧中定位该对象，并以像素级别将其mask掉；然后利用由Deep-Video-Inpainting为原理实现的inpaint函数对mask的区域进行修补。从而实现视频对象擦除的功能。

本项目代码涉及到cuda、python、c以及shell编程，我尝试了，在Ubuntu16.04、pytorch0.4.0、python3.5.6、CUDA9.0、gcc5.4.0下编译通过。因为我是在服务器上跑的，为了环境部署的方便，我保存了一个docker镜像：**docker pull overwhelmedx/xiahou:ubuntu16.04_cuda9.0_gcc5.4_py3**

## 编译与调用
为了能够直接使用mask和inpainting两个模型，首先需要将预训练好的模型下载，并放在*cp*目录下。
然后对项目进行编译：
***
cd get_mask

bash make.sh

cd ../inpainting

bash install.sh

cd ..
***
预训练模型放在cp目录中，源视频文件在data目录中，mask的模型实现在get_mask目录中，deep-video-inpainting模型实现在inpainting目录中，最终擦除结果视频放在results目录中。

对视频进行擦除：
***
python demo.py --data data/videoname.avi
***

## 工作&问题
由于我没有本地显卡，所以只能在服务器上跑，但服务器上只有CUDA10.0和CUDA11.0，并且系统为Ubuntu18.04，GCC版本也不适配，我做了很多尝试，但是该项目所用的环境比较旧，服务器上的大环境不能支持
，鉴于该项目与任务的高度匹配性，没有再找其他代码
所以我在服务器上建了一个docker如上所述。在docker中的环境没有任何问题，但是由于本项目会输出一个GUI让用户框出目标，而目前我了解到docker只能安装opencv-python-headless，不能安装opencv-python，opnecv-python-headless不具有GUI模块，所以所以最终没有成功擦除一个视频。

虽然最终没有跑出一个成功擦除的视频，但是该项目让我了解到很多关于video领域的知识，包括目标跟踪、二进制掩膜、视频修复等等，也让我进一步更深入理解了Linux系统，包括系统配置、软连接、系统变量等等，还让我学习了GitHub的使用，git push等等，与docker的使用和image的保存。
总之，收获良多。
