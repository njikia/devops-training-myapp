from fastapi.testclient import TestClient
from myapp.main import app

client = TestClient(app)

def test_health():
    r = client.get("/health")
    assert r.status_code == 200
    assert r.json() == {"status": "ok"}

def test_hello_default():
    r = client.get("/hello")
    assert r.status_code == 200
    assert r.json() == {"message": "hello, world"}

def test_hello_name():
    r = client.get("/hello?name=Nikita")
    assert r.status_code == 200
    assert r.json() == {"message": "hello, Nikita"}
