FROM qwen2-service-base

ADD ./huggingface/hub/models--Qwen--Qwen2-7B-Instruct /root/.cache/huggingface/hub/models--Qwen--Qwen2-7B-Instruct

EXPOSE 8000
CMD [ "python", "-m", "vllm.entrypoints.openai.api_server", "--model", "Qwen/Qwen2-7B-Instruct", "--max-model-len", "20432"]
