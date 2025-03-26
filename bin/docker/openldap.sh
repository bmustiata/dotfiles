docker run --detach --rm --name openldap \
  --network host \
  --env LDAP_ADMIN_USERNAME=admin \
  --env LDAP_ADMIN_PASSWORD=adminpassword \
  --env LDAP_USERS=customuser \
  --env LDAP_PASSWORDS=custompassword \
  bitnami/openldap:latest

echo "cn=admin,dc=example,dc=org               : adminpassword"
echo "cn=customuser,ou=users,dc=example,dc=org : custompassword"

