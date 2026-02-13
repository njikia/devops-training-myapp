# 1️⃣ Base image: minimal Python runtime
FROM python:3.12-slim

# 2️⃣ Set working directory inside container
WORKDIR /app

ENV PYTHONPATH=/app/src

# 3️⃣ Prevent Python from writing .pyc files
ENV PYTHONDONTWRITEBYTECODE=1

# 4️⃣ Ensure Python output is not buffered (important for logs)
ENV PYTHONUNBUFFERED=1

# 5️⃣ Copy dependency file first (for Docker layer caching)
COPY requirements.txt .

# 6️⃣ Install dependencies into container's Python
RUN pip install --no-cache-dir -r requirements.txt

# 7️⃣ Copy application source code
COPY src/ ./src/

# 8️⃣ Expose port 8000 (documentation for container runtime)
EXPOSE 8000

# 9️⃣ Default command to start the app
CMD ["python", "-m", "uvicorn", "myapp.main:app", "--host", "0.0.0.0", "--port", "8000"]

