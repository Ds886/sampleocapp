var http = require('http');
async function ConnectDB(){
  const { Client } = require('pg')
  const client = new Client({
  	user: process.env.PGUSER,
  	password: process.env.PGPASSWORD,
  	host: process.env.PGHOST,
  	port: process.env.PGPORT,
  });
  await client.connect()

  try {
     const res = await client.query('SELECT $1::text as message', ['Hello world!'])
     console.log(res.rows[0].message) // Hello world!
  } catch (err) {
     console.error(err);
  } finally {
     await client.end()
  }
}
ConnectDB()

http.createServer(function (req, res) {
  res.writeHead(200, {'Content-Type': 'text/html'});
  res.end('Hello World!');
}).listen(8080); 
