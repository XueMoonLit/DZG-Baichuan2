# DZG-Baichuan2 一个文言文大模型

以Baichuan2-7B-Base作为基座模型<br>
使用Daizhige和CLUECorpusSmall作为语料进行增量预训练，对不同数据配比进行了探索<br>
开源了1：1，1：2和1：5三个版本的LoRA权重，需要和基座模型进行合并<br>
#### 特别注意：基座模型需要使用LLaMAfied的Baichuan2模型，且不支持直接推理，请进行SFT后再进行推理

### 配置LLaMA-Factory
```
git clone https://github.com/hiyouga/LLaMA-Factory.git
cd LLaMA-Factory/
pip install -e .[torch,metrics]
```

### 下载Baichuan2-LLaMAfied(需要LFS)
```
git clone https://huggingface.co/hiyouga/Baichuan2-7B-Base-LLaMAfied.git
mv Baichuan2-7B-Base-LLaMAfied/LLaMA-Factory/
```

### 合并权重
```
./run_merge.sh DZG-Baichuan2_1_2
训练和推理详见LLaMA-Factory
```

## 说明
这是本人硕士毕业论文的一部分，后续没有继续升学的打算，所以由于时间和算力有限只能做到这么多了，跟Baichuan2-7B-Base相比提升不大，还有很大提升空间，包括模型规模，数据质量，batch size等等。<br>
我只是做了初步的探索，毕业论文本来没必要开源，但是我认为促进文言文大模型的发展需要大家的努力，我希望我踩过的坑能为一线调参人员提供一些参考。
