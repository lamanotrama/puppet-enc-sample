puppet-enc-sample
=================

## encとはなんぞや

https://docs.puppetlabs.com/guides/external_nodes.html

 * 普通はmaster/agent構成で使う
   * masterが、agentのcertnameを引数にしてencスクリプトを実行
   * スクリプトでごにょって、適用するクラスとかをyamlで出力
 * applyでも可能！(agent自信がmasterのように振る舞って、encスクリプトを実行)


## applyでためしてみる

### 全部オプションで指定して実行

```
puppet apply --node_terminus exec --external_nodes $(pwd)/enc.rb --modulepath ./modules -e '' --certname app001.example.com
puppet apply --node_terminus exec --external_nodes $(pwd)/enc.rb --modulepath ./modules -e '' --certname cache001.example.com
puppet apply --node_terminus exec --external_nodes $(pwd)/enc.rb --modulepath ./modules -e '' --certname unknown.example.com

# manifestdirを指定するとsite.ppも実行されます
puppet apply --node_terminus exec --external_nodes $(pwd)/enc.rb --modulepath ./modules -e '' --certname app001.example.com --manifestdir=./manifests
# (なぜか)これだと実行されない
# puppet apply --node_terminus exec --external_nodes $(pwd)/enc.rb --modulepath ./modules --certname app001.example.com ./manifests/site.pp
```

### configをおいといて指定してもOK


```
cat <<EOT > puppet.conf
[main]
node_terminus  = exec
external_nodes = $(pwd)/enc.rb
manifestdir    = $(pwd)/manifests
modulepath     = $(pwd)/modules
EOT

puppet apply --config ./puppet.conf -e '' --certname app001
```

## master/agent構成の場合

WIP
