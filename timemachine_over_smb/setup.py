from csv import reader
from os import mkdir, environ

with open('.env', 'r') as fh:
    vars_dict = dict(
        tuple(line.split('='))
        for line in fh.read().splitlines()
        if not line.startswith('#')
    )

environ.update(vars_dict)

with open('users.csv') as f:
    upqs = list(reader(f))
# making folders:

for user,_,_ in upqs:
    mkdir(environ['BACKUP_VOLUME'] + "/" + user)

# making docker compose file

user_args = ''
for u,p,_ in upqs:
    user_args += ' -u "{};{}"'.format(u, p)

with open('compose-t.yml') as f, open('docker-compose.yml', 'w') as wf:
    wf.write(f.read().replace("{USERS}", user_args))

# making plist quotas

GB = 1000000000

for u,_,q in upqs:
    with open("plist_t.xml")as t, open("{}/{}/{}".format(environ['BACKUP_VOLUME'],u,".com.apple.TimeMachine.quota.plist"), 'w') as f:
        template = t.read()
        f.write(template.replace("{USER_QUOTA}", str(int(q) * GB)))
