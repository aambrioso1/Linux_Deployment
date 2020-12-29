from typing import Optional

from fastapi import FastAPI

app = FastAPI()

@app.get("/")
def read_root():
	# Why the weird syntax here?
    return {"Hello": "World"}

@app.get("/items/{item_id}")
def read_item(item_id: int, q: Optional[str] = None):
    return {"item_id": item_id, "q": q}

"""
# For asynch and await prepend the function definitions with asynch as follows:
@app.get("/")
asynch def read_root():
    return {"Hello": "World"}


@app.get("/items/{item_id}")
asynch def read_item(item_id: int, q: Optional[str] = None):
    return {"item_id": item_id, "q": q}
"""