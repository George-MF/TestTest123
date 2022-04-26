FROM python:3.8



    WORKDIR /dir/

    COPY requirements.txt .
    RUN pip install -r requirements.txt
    
    COPY .. ./dir
    
    CMD ["python"]