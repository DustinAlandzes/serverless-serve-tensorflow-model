from backend.app import schema


def test_query():
    query = """
        query TestQuery {
            books {
                title
                author
            }
        }
    """


    result = schema.execute_sync(
        query,
        variable_values={"title": "Animal Farm"},
    )


    assert result.errors is None
    assert result.data["books"] == [
        {
            "title": "Animal Farm",
            "author": "George Orwell",
        }
    ]