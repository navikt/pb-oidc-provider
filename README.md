# Personbruker OIDC-provider

OIDC-provider ment for å brukes på localhost ved testing av applikasjoner lokalt.
Dette docker-image-et bruker `qlik/simple-oidc-provider`, men det er lagt til konfigurasjon 
som er spesifikk for Team Personbruker sine apper. Mer info om original-image-et finnes [her](https://hub.docker.com/r/qlik/simple-oidc-provider/)

Det finnes også et mini GUI som kan brukes for å hente ut tokens, som er kjekt ved testing av backend-apper. 
Se [pb-oidc-provider-gui](https://github.com/navikt/pb-oidc-provider-gui)

# Kom i gang

## Bygge ny versjon og kjøring lokalt
1. Bygg ny versjon: `docker build . -t navikt/pb-oidc-provider:<nytt versjonsnummer>`
2. Kjøre imaget lokalt, `docker run -p 9000:9000 navikt/pb-oidc-provider:<versjonsnummeret fra steg 1>`

## Bruke denne som OIDC-provider for din app
1. Konfigurer din app til å bruke denne OIDC-provider-en:
   Alle relevante parametere finnes i filen config.json, de typisk nøkkelverdiene som må settes i din app er:
     - `issuer_name` heter `idp_name` i konfig-filen, default-verdien er: http://localhost-issuer
     - `accepted_audience` heter `client_id` i konfig-filen, default-verdien er: aud-localhost
     - `discoveryurl`, portnummeret kan endres i konfig-filen ved å endre feltet `port`, default-verdien er: "http://localhost:9000/.well-known/openid-configuration"
2. Start OIDC-provideren: `docker run -p 9000:9000 navikt/pb-oidc-provider:<versjonsnummerer>`
3. Start din app.
4. Brukere og passord er definert i filen `users.json`

# Henvendelser

Spørsmål knyttet til koden eller prosjektet kan rettes mot https://github.com/orgs/navikt/teams/personbruker

## For NAV-ansatte

Interne henvendelser kan sendes via Slack i kanalen #team-personbruker.
