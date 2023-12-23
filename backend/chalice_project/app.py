import typing
from chalice import Chalice
from chalice.app import Request, Response
import strawberry
from strawberry.chalice.views import GraphQLView

app = Chalice(app_name="ChaliceProject")
app.api.cors = True

@strawberry.type
class Book:
    title: str
    author: str


def get_books():
    return [
        Book(
            title="Animal Farm",
            author="George Orwell",
        ),
    ]


@strawberry.type
class Query:
    books: typing.List[Book] = strawberry.field(resolver=get_books)


@strawberry.type
class Mutation:
    @strawberry.mutation
    def echo(self, string_to_echo: str) -> str:
        return string_to_echo


schema = strawberry.Schema(query=Query, mutation=Mutation)
view = GraphQLView(schema=schema, graphiql=True)


@app.route("/graphql", methods=["GET", "POST"], content_types=["application/json"])
def handle_graphql() -> Response:
    request: Request = app.current_request
    return view.execute_request(request)
