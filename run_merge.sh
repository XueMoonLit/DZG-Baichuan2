#!/bin/bash

folder_to_move="$1"

target_path="LLaMA-Factory/lora"

# 检查文件夹是否存在
if [ ! -d "$folder_to_move" ]; then
    echo "文件夹 '$folder_to_move' 不存在。"
    exit 1
fi

if [ ! -d "$target_path" ]; then
    mkdir -p "$target_path"
fi

mv "$folder_to_move" "$target_path"

# 检查移动是否成功
if [ $? -eq 0 ]; then
    echo "文件夹 '$folder_to_move' 已成功移动到 '$target_path'。"
else
    echo "移动文件夹 '$folder_to_move' 时出错。"
fi

cd "LLaMA-Factory/"

target_path+="/"
target_path+="$folder_to_move"
model_path="model/"
model_path+="$folder_to_move"

CUDA_VISIBLE_DEVICES=0 python src/export_model.py \
    --model_name_or_path Baichuan2-7B-Base-LLaMAfied/ \
    --adapter_name_or_path "$target_path" \
    --template baichuan2 \
    --finetuning_type lora \
    --export_dir "$model_path" \
    --export_size 2 \
    --export_legacy_format False

