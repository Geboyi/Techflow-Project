import pytest
from app import app

@pytest.fixture
def client():
    app.config["TESTING"] = True
    with app.test_client() as client:
        yield client

def test_hello_returns_200(client):
    response = client.get("/")
    assert response.status_code == 200

def test_hello_contains_text(client):
    response = client.get("/")
    assert b"Hello" in response.data

def test_health_endpoint(client):
    response = client.get("/health")
    assert response.status_code == 200
    data = response.get_json()
    assert data["status"] == "ok"


# -- additional two unit test added
def test_health_returns_json(client):
    response = client.get("/health")
    assert response.is_json

def test_invalid_route_returns_404(client):
    response = client.get("/invalid-route")
    assert response.status_code == 404