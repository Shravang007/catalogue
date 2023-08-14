FROM          node:18
RUN           mkdir /app
WORKDIR       /app
COPY          ./ /app/
RUN           npm install
COPY          run.sh .
RUN           curl -s -L https://truststore.pki.rds.amazonaws.com/global/global-bundle.pem -o /app/rds-combined-ca-bundle.pem
ENTRYPOINT    ["bash", "run.sh"]

