# coding: utf-8
Faalis::Engine.load_seed


radio_boot = SiteFramework::Site.create!(title: 'رادیو بوت',
  description: 'پادکست رادیو بوت، به بهانه تکنولوژی')

SiteFramework::Domain.create!(site: radio_boot,
  name:'radioboot.local', alias: false)
