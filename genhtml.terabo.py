#!/usr/bin/env python
# -*- coding: utf-8 -*-

from jinja2 import Environment, FileSystemLoader

env = Environment(loader=FileSystemLoader('.', encoding='utf-8'))
tpl = env.get_template('champly.tpl')
param = {}

#### HTMLを生成するための設定項目 ####
# サイト名
param['sitename'] = 'terabo.net'
# ベースURL
param['baseurl'] = 'https://www.terabo.net/champly'
# パンくずリスト
param['breadcrumb'] = '<a href="/">Top</a> <i class="icon-angle-right"></i> <a href="./">Champly!</a>'
# Googleアナリティクス
param['ga'] = 'UA-56685700-1'
################################

print(tpl.render(param=param))
