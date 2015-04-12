# gnupack_devel-12.03-2015.02.01

## githubへのアクセス

```
# git push -u origin master
Could not create directory '/c/Program Files/startup/home/.ssh'.
...
```

RSA公開鍵が見つからないようなので作成する。

```
# ssh-keygen -t rsa -C <mail>
Enter file in which to save the key (/c/Program Files/startup/home/.ssh/id_rsa): 
...
Saving the key failed: /c/Program Files/startup/home/.ssh/id_rsa.
```

失敗する。

```
# ls /c/Program\ Files/startup
ls: /c/Program Files/startup にアクセスできません: No such file or directory
# ls -l /c
...
drwxr-xr-x 1 ksugita mkpasswd          0 1月  22 22:39 Program Files/
...
```

権限がなくて作成できていない。

システムディレクトリの権限変更は避けたい。

.sshのパスを変更する方向で調査。

どこかで"/c/Program Files/startup/home"を設定してるファイルもしくは環境変数がありそう。

```
# env | grep startup
# grep startup -R /etc
...
/etc/passwd:ksugita:*:400:401:,*:/c/Program Files/startup/home:/bin/sh
...
```

なるほどスギタさん（誰？gnupack作者かな？）のホームディレクトリだ。

ちなみに自分のホームディレクトリは/homeになっており、こちらが参照されてれば問題発生しなそう。

シェルがksugitaとして実行してるぽいな。


```
# who
```

空だ。


```
# touch a
# ls -l a
-rw-r--r-- 1 ksugita mkpasswd    0 4月  12 14:47 a
```

ログインユーザを自分にしたいけどよくわからんのでksugitaのホーム変更/home。
ウィンドウズ再起動すると.sshの参照パスがかわってくれた。

```
# ssh-keygen -t rsa -C <mail>
Generating public/private rsa key pair.
Enter file in which to save the key (/home/.ssh/id_rsa):
...
# ls ~/.ssh
id_rsa	id_rsa.pub
```

成功。