#include <psibase/psibase.hpp>

using namespace psibase;
using namespace std;

// Create a database table
struct ResultRow
{
   AccountNumber account;
   int32_t       result;
};
PSIO_REFLECT(ResultRow, account, result);
using ResultTable = Table<ResultRow, &ResultRow::account>;

// Specify tables in the database
using Db = ServiceTables<WebContentTable, ResultTable>;

// Add a GraphQL query for the database table
struct Queries
{
   auto results() const
   {  //
      return Db().open<ResultTable>().getIndex<0>();
   }
};
PSIO_REFLECT(Queries, method(results))

// Define the web service. Each function is an action that may be called.
struct __service__Service
{
   void add(int32_t a, int32_t b)
   {
      auto table = Db().open<ResultTable>();
      auto found = table.get(getSender());
      auto row   = found ? found.value() : ResultRow{getSender(), 0};
      row.result = a + b;
      table.put(row);
   }

   void multiply(int32_t a, int32_t b)
   {
      auto table = Db().open<ResultTable>();
      auto found = table.get(getSender());
      auto row   = found ? found.value() : ResultRow{getSender(), 0};
      row.result = a * b;
      table.put(row);
   }

   // Add a serveSys action to respond to http requests to serve packed actions,
   //   UIs, and GraphQL queries.
   auto serveSys(HttpRequest request) -> optional<HttpReply>
   {
      if (auto result = servePackAction<__service__Service>(request))
         return result;

      if (auto result = serveContent(request, Db{}))
         return result;

      if (auto result = serveGraphQL(request, Queries{}))
         return result;

      return nullopt;
   }

   // Add a storeSys action to allow the storing of UIs
   void storeSys(string path, string contentType, vector<char> content)
   {
      check(getSender() == getReceiver(), "wrong sender");
      storeContent(move(path), move(contentType), move(content), Db());
   }
};
PSIO_REFLECT(__service__Service,
             method(add, a, b),
             method(multiply, a, b),
             method(serveSys, request),
             method(storeSys, path, contentType, content));

PSIBASE_DISPATCH(__service__Service)
