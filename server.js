//backend
require("dotenv").config();//carica la libreria dotenv, .config()cerca e legge .env
const http = require("node:http"); // prende il modulo http da node
const fs = require("node:fs"); //fs modulo per lavorare con i file

const server = http.createServer((request, response) => {
    console.log("Metodo:", request.method);
    console.log("Percorso:", request.url);

    if (request.method === "GET" && request.url === "/") {//metodo get e solito percorso
    response.writeHead(200, { "Content-Type": "text/html; charset=utf-8" }); //dici che colleghi un html, intestazione risposta
    response.end(fs.readFileSync("index.html", "utf8"));//colleghi il file html alla richiesta del browser, cosi il server manda al browser quella pagina

    } else if (request.method === "GET" && request.url === "/style.css") {
        response.writeHead(200, {
        "Content-Type": "text/css; charset=utf-8"});
        response.end(fs.readFileSync("style.css", "utf8"));


    } else if (request.method === "GET" && request.url === "/clienti") {//metodo get e percorso clienti
    response.writeHead(200, { "Content-Type": "text/plain; charset=utf-8" });
    response.end("Qui in futuro vedremo le clienti");

    } else {
    response.writeHead(404, { "Content-Type": "text/plain; charset=utf-8" });//404 è il codice per "risorsa non trovata"     
    response.end("Pagina non trovata");
    }
});

server.listen(3000, () => { //resta in ascolto sulla porta 3000
    console.log("Server in ascolto su http://localhost:3000");
});
