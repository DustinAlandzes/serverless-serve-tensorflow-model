import typing
from chalice import Chalice
from chalice.app import Request, Response, CORSConfig
import strawberry
from strawberry.chalice.views import GraphQLView
from chalice import CognitoUserPoolAuthorizer

app = Chalice(app_name="ChaliceProject")

# https://aws.github.io/chalice/api.html#CORSConfig
cors_config = CORSConfig(
    allow_origin='https://d1envi61nk6uvp.cloudfront.net',
    allow_credentials=True,
    expose_headers=["Authorization"]
)
app.api.cors = cors_config

# https://aws.github.io/chalice/topics/authorizers.html
authorizer = CognitoUserPoolAuthorizer(
    'pool', provider_arns=['arn:aws:cognito-idp:us-west-2:166242363699:userpool/us-west-2_YJ59HjYLm'])


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


@app.route("/graphql", methods=["GET", "POST"], content_types=["application/json"], authorizer=authorizer)
def handle_graphql() -> Response:
    request: Request = app.current_request
    return view.execute_request(request)
