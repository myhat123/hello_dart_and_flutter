from cryptography.fernet import Fernet
import os, base64

x = 'my32lengthsupersecretnooneknows1'
print(len(x))

key = base64.urlsafe_b64encode(x.encode())
f = Fernet(key)
token = f.encrypt(b"360102197001012880")
print(token)
print(f.decrypt(token))

print(f.decrypt(b'gAAAAABeaE+AGCtJipEjfS4q9WoXW3lvGKsLh7r4vOjWefSOJa5MDX377bNm9i+ivSW65p3rjKikCcsPYnyNLjB0XV8nR5UZXSyCJxKdDhJeop7SmMgt+JM='))