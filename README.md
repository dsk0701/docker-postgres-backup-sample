# docker-postgres-backup-sample

## Testing

Data Posting

    $ cd test/SonarSource-sonar-examples-02bb769/projects/languages/{language you want to test}/sonar-runner
    $ sonar-runner -Dsonar.host.url=http://192.168.59.103:9000 -Dsonar.jdbc.url=jdbc:postgresql://192.168.59.103:5432/sonar_test -Dsonar.jdbc.username=sonar_test -Dsonar.jdbc.password=sonar_test

Backup

    $ cd /path/to/project
    $ ./backup.sh

Restore

    $ cd /path/to/project
    $ mkdir -p restore
    $ cp backup/backup-{date you want to restore}.tar.gz restore/.
    $ docker-compose up -d

Checking result

    $ open http://192.168.59.103:9000

