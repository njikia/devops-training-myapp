from fastapi import FastAPI

app = FastAPI()


@app.get("/health")
def health():
    return {"status": "broken"}


@app.get("/hello")
def hello(name: str = "world"):
    return {"message": f"hello, {name}"}

