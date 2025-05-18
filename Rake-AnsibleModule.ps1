$Website = 'https://docs.ansible.com/ansible/latest/collections/ansible/builtin/user_module.html#ansible-collections-ansible-builtin-user-module'

$RawWeb = Invoke-WebRequest -Uri $Website

$Content =  $RawWeb.Content -split "`n"
$Content | Select-String "[Aa]uthorization"