#site.pp

node 'puppetagent1.localdomain' {
include role:webserver
}
